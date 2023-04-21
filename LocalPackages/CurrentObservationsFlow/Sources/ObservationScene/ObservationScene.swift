import Domain
import Library
import SwiftUI

public enum ObservationScene {
    @MainActor
    public static func create(with observation: Observation) -> some View {
        let initialState = ObservationState(observation: observation)
        let environment = ObservationEnvironment()
        let store = Store(initialState: initialState, transform: transform, apply: apply, environment: environment)
        return ObservationView(store: store)
    }

    internal static func transform(
        state _: ObservationState,
        event: ObservationEvent,
        env _: ObservationEnvironment
    ) -> AsyncStream<ObservationEffect> {
        AsyncStream<ObservationEffect> { continuation in
            switch event {
            case .userEnteredScene:
                continuation.yield(.sceneLoaded)
                continuation.finish()
            }
        }
    }

    internal static func apply(state: ObservationState, effect: ObservationEffect) -> ObservationState {
        var newState = state

        switch effect {
        case .sceneLoaded:
            newState.isSceneLoaded = true
        }

        return newState
    }
}
