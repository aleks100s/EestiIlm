import APIService
import CurrentObservationsScene
import Domain
import ObservationScene
import SwiftUI

internal struct CurrentObservationsFlow: View {
    private enum Scene {
        case currentObservations
    }

    private let apiService: APIService

    @State private var path = [Scene]()
    @State private var selectedObservation: Observation?

    var body: some View {
        NavigationStack(path: $path) {
            CurrentObservationsScene.create(with: apiService, showObservation: showObservation)
                .navigationTitle(.currentObservations)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Scene.self) { view(for: $0) }
        }
        .sheet(item: $selectedObservation) { observation in
            ObservationScene.create(with: observation)
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium])
        }
    }

    internal init(apiService: APIService) {
        self.apiService = apiService
    }

    @MainActor @ViewBuilder
    private func view(for scene: Scene) -> some View {
        switch scene {
        case .currentObservations:
            CurrentObservationsScene.create(with: apiService, showObservation: showObservation)
        }
    }

    private func showObservation(_ observation: Observation) {
        selectedObservation = observation
    }
}
