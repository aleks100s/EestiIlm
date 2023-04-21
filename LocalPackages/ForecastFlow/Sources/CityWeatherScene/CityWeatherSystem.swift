// swiftlint:disable:this file_name
import Domain

internal struct CityWeatherState {
    let place: Place?
    let wind: Wind?
    var isSceneLoaded = false
}

internal enum CityWeatherEvent {
    case userEnteredScene
}

internal enum CityWeatherEffect {
    case sceneLoaded
}

internal struct CityWeatherEnvironment {}
