import APIService
import Domain
import Library
import SwiftUI

public enum ForecastScene {
    @MainActor
    public static func create(
        apiService: APIService,
        showPlace: @escaping (Place) -> Void,
        showWind: @escaping (Wind) -> Void
    ) -> some View {
        let environment = ForecastEnvironment(apiService: apiService, showPlace: showPlace, showWind: showWind)
        let store = Store(
            initialState: ForecastState(),
            transform: transform,
            apply: apply,
            environment: environment
        )
        return ForecastView(store: store)
    }

    internal static func transform(
        state _: ForecastState,
        event: ForecastEvent,
        env: ForecastEnvironment
    ) -> AsyncStream<ForecastEffect> {
        AsyncStream<ForecastEffect> { continuation in
            switch event {
            case .userEnteredScene:
                Task.detached {
                    let result = try await env.apiService.getWeatherForecast()
                    continuation.yield(.sceneLoaded(result))
                    continuation.finish()
                }

            case let .userSelectedDate(date):
                continuation.yield(.selectedDateChanged(date))
                continuation.finish()

            case .userToggledDayTime:
                continuation.yield(.dayTimeChanged)
                continuation.finish()

            case let .userTappedWind(wind):
                env.showWind(wind)
                continuation.yield(.nothing)
                continuation.finish()

            case let .userTappedPlace(place):
                env.showPlace(place)
                continuation.yield(.nothing)
                continuation.finish()
            }
        }
    }

    internal static func apply(state: ForecastState, effect: ForecastEffect) -> ForecastState {
        var newState = state

        switch effect {
        case let .sceneLoaded(forecasts):
            newState.isSceneLoaded = true
            newState.allForecasts = forecasts
            newState.selectedForecast = forecasts.first

        case .dayTimeChanged:
            newState.isNight.toggle()

        case let .selectedDateChanged(date):
            newState.selectedForecast = newState.allForecasts.first { $0.date == date }

        case .nothing:
            break
        }

        return newState
    }
}
