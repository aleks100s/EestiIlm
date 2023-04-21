// swiftlint:disable:this file_name
import Domain

internal struct ObservationState {
    let observation: Observation
    var isSceneLoaded = false
}

internal enum ObservationEvent {
    case userEnteredScene
}

internal enum ObservationEffect {
    case sceneLoaded
}

internal struct ObservationEnvironment {}
