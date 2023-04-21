import APIService
import CityWeatherScene
import Domain
import ForecastScene
import SwiftUI
import MapKit

internal struct ForecastFlow: View {
    private enum Scene: Hashable {
        case forecast
        case cityWeather(Place?, Wind?)
    }

    private let apiService: APIService

    @State private var path = [Scene]()

    var body: some View {
        NavigationStack(path: $path) {
            ForecastScene.create(
                apiService: apiService,
                showPlace: showPlace,
                showWind: showWind
            )
            .navigationTitle(.forecast)
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Scene.self) { view(for: $0) }
        }
    }

    internal init(apiService: APIService) {
        self.apiService = apiService
    }

    @MainActor @ViewBuilder
    private func view(for scene: Scene) -> some View {
        switch scene {
        case .forecast:
            ForecastScene.create(
                apiService: apiService,
                showPlace: showPlace,
                showWind: showWind
            )

        case let .cityWeather(place, wind):
            CityWeatherScene.create(with: place, or: wind)
        }
    }

    private func showWind(_ wind: Wind) {
        path.append(.cityWeather(nil, wind))
    }

    private func showPlace(_ place: Place) {
        path.append(.cityWeather(place, nil))
    }
}

internal struct MapView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)

            Circle()
                .fill(.red)
                .frame(width: 16, height: 16)

            VStack(alignment: .leading) {
                Spacer()
                Text("Center: \(viewModel.mapRegion.center.description)")
            }
        }
    }
}

internal final class ViewModel: ObservableObject {
    @Published var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 58.378, longitude: 26.729),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
}

internal extension CLLocationCoordinate2D {
    var description: String {
        "\(latitude); \(longitude)"
    }
}
