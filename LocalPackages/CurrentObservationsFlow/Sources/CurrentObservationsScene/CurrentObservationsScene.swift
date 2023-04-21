import APIService
import Domain
import Library
import SwiftUI

public enum CurrentObservationsScene {
    @MainActor
    public static func create(
        with apiService: APIService,
        showObservation: @escaping (Observation) -> Void
    ) -> some View {
        let initialState = CurrentObservationsState()
        let environment = CurrentObservationsEnvironment(apiService: apiService, showObservation: showObservation)
        let store = Store(initialState: initialState, transform: transform, apply: apply, environment: environment)
        return CurrentObservationsView(store: store)
    }

    internal static func transform(
        state _: CurrentObservationsState,
        event: CurrentObservationsEvent,
        env: CurrentObservationsEnvironment
    ) -> AsyncStream<CurrentObservationsEffect> {
        AsyncStream<CurrentObservationsEffect> { continuation in
            switch event {
            case .userEnteredScene:
                continuation.yield(.sceneLoaded)
                Task.detached {
                    let result = try await env.apiService.getCurrentObservations()
                    continuation.yield(.observationsLoaded(result))
                    continuation.finish()
                }

            case let .userTappedObservation(observation):
                env.showObservation(observation)
                continuation.yield(.nothing)
                continuation.finish()
            }
        }
    }

    internal static func apply(
        state: CurrentObservationsState,
        effect: CurrentObservationsEffect
    ) -> CurrentObservationsState {
        var newState = state

        switch effect {
        case .sceneLoaded:
            newState.isSceneLoaded = true

        case let .observationsLoaded(observations):
            newState.observations = observations

        case .nothing:
            break
        }

        return newState
    }
}
