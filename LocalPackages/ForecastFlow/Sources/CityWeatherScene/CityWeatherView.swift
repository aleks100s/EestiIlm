import DesignSystem
import Domain
import Library
import SwiftUI

internal struct CityWeatherView: View {
    @ObservedObject var store: Store<CityWeatherState, CityWeatherEvent, CityWeatherEffect, CityWeatherEnvironment>

    var body: some View {
        if let place = store.state.place {
            WeatherView(
                thumbnailImageName: "cloud.bolt.rain",
                mainText: place.phenomenon,
                labelImageName: "thermometer",
                labelText: place.maxTemperatureDescription
            )
            .navigationTitle(place.name)
        } else if let wind = store.state.wind {
            WeatherView(
                thumbnailImageName: "wind",
                mainText: wind.direction,
                labelImageName: "wind",
                labelText: wind.speedDescription
            )
            .navigationTitle(wind.name)
        } else {
            EmptyView()
                .navigationTitle(Text(verbatim: .errorNavigationTitle))
        }
    }
}

internal struct CityWeatherViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CityWeatherScene.create(
                with: .default,
                or: nil
            )
        }
    }
}
