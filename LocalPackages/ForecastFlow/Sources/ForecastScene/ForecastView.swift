import APIServiceImpl
import DesignSystem
import Domain
import Library
import SwiftUI

internal struct ForecastView: View {
    @ObservedObject var store: Store<ForecastState, ForecastEvent, ForecastEffect, ForecastEnvironment>

    var body: some View {
        if store.state.isSceneLoaded {
            List {
                headerSection()
                generalConditionsSection()
                seaConditionsSection()
                peipsiConditionsSection()
                placesSection()
                windsSection()
            }
            .toolbar(content: toolbar)
        } else {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .onAppear {
                    store.send(.userEnteredScene)
                }
        }
    }

    @ViewBuilder
    private func headerSection() -> some View {
        Section {
            VStack(spacing: 16) {
                DetailedText(
                    leftText: store.state.selectedForecast?.date.stringRepresentation ?? "...",
                    rightText: store.state.isNight ? .night : .day
                )

                Image(systemName: "cloud.bolt.rain")
                    .makeThumbnail()

                if let forecast = store.state.daily {
                    VStack(spacing: 8) {
                        Text(forecast.phenomenon)
                            .font(.title)
                        HStack(spacing: 40) {
                            Label(forecast.minTemperatureDescription, systemImage: "thermometer.snowflake")
                            Label(forecast.maxTemperatureDescription, systemImage: "thermometer.sun.fill")
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func generalConditionsSection() -> some View {
        if let text = store.state.daily?.generalConditions, !text.isEmpty {
            Section(.generalConditions) {
                Text(text)
            }
        }
    }

    @ViewBuilder
    private func seaConditionsSection() -> some View {
        if let text = store.state.daily?.seaConditions, !text.isEmpty {
            Section(.seaConditions) {
                Text(text)
            }
        }
    }

    @ViewBuilder
    private func peipsiConditionsSection() -> some View {
        if let text = store.state.daily?.peipsiConditions, !text.isEmpty {
            Section(.peipsiConditions) {
                Text(text)
            }
        }
    }

    @ViewBuilder
    private func placesSection() -> some View {
        if let places = store.state.daily?.places {
            Section(.places) {
                ForEach(places) { place in
                    Button {
                        store.send(.userTappedPlace(place))
                    } label: {
                        DetailedText(
                            leftText: place.name,
                            rightText: place.maxTemperatureDescription
                        )
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func windsSection() -> some View {
        if let winds = store.state.daily?.winds {
            Section(.winds) {
                ForEach(winds) { wind in
                    Button {
                        store.send(.userTappedWind(wind))
                    } label: {
                        DetailedText(leftText: wind.name, rightText: wind.maxSpeedDescription)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func toolbar() -> some View {
        Button {
            store.send(.userToggledDayTime)
        } label: {
            Label(.dayNight, systemImage: store.state.isNight ? "moon.fill" : "sun.max.fill")
        }

        Menu {
            ForEach(store.state.allForecasts.map(\.date)) { date in
                Button(date.stringRepresentation, action: { store.send(.userSelectedDate(date)) })
            }
        } label: {
            Label(.selectDate, systemImage: "calendar")
        }
    }
}

internal struct ForecastViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ForecastScene.create(apiService: APIServiceImpl(), showPlace: { _ in }, showWind: { _ in })
                .navigationTitle(.forecast)
        }
    }
}
