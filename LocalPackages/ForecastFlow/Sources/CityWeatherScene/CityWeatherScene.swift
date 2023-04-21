import Domain
import Library
import SwiftUI

public enum CityWeatherScene {
    @MainActor
    public static func create(with place: Place?, or wind: Wind?) -> some View {
        let environment = CityWeatherEnvironment()
        let store = Store(
            initialState: CityWeatherState(place: place, wind: wind),
            transform: transform,
            apply: apply,
            environment: environment
        )
        return CityWeatherView(store: store)
    }

    internal static func transform(
        state _: CityWeatherState,
        event: CityWeatherEvent,
        environment _: CityWeatherEnvironment
    ) -> AsyncStream<CityWeatherEffect> {
        AsyncStream<CityWeatherEffect> { continuation in
            switch event {
            case .userEnteredScene:
                continuation.yield(.sceneLoaded)
            }
        }
    }

    internal static func apply(state: CityWeatherState, effect: CityWeatherEffect) -> CityWeatherState {
        var newState = state

        switch effect {
        case .sceneLoaded:
            newState.isSceneLoaded = true
        }

        return newState
    }
}
