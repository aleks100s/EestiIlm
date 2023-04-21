// swiftlint:disable:this file_name
import APIService
import Domain

internal struct CurrentObservationsState: Equatable {
    var isSceneLoaded = false
    var observations: [Observation] = []
}

internal enum CurrentObservationsEvent: Equatable {
    case userEnteredScene
    case userTappedObservation(Observation)
}

internal enum CurrentObservationsEffect: Equatable {
    case sceneLoaded
    case observationsLoaded([Observation])
    case nothing
}

internal struct CurrentObservationsEnvironment {
    let apiService: APIService
    let showObservation: (Observation) -> Void
}
