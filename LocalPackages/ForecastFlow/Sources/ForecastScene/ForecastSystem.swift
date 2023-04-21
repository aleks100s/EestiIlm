// swiftlint:disable:this file_name
import APIService
import Domain
import Foundation

internal struct ForecastState: Equatable {
    var isSceneLoaded = false
    var isNight = false
    var allForecasts: [Forecast] = []
    var selectedForecast: Forecast?

    var daily: DailyForecast? {
        isNight ? selectedForecast?.night : selectedForecast?.day
    }
}

internal enum ForecastEvent {
    case userEnteredScene
    case userToggledDayTime
    case userSelectedDate(Date)
    case userTappedPlace(Place)
    case userTappedWind(Wind)
}

internal enum ForecastEffect: Equatable {
    case sceneLoaded([Forecast])
    case dayTimeChanged
    case selectedDateChanged(Date)
    case nothing
}

internal struct ForecastEnvironment {
    let apiService: APIService
    let showPlace: (Place) -> Void
    let showWind: (Wind) -> Void

    internal init(
        apiService: APIService,
        showPlace: @escaping (Place) -> Void,
        showWind: @escaping (Wind) -> Void
    ) {
        self.showPlace = showPlace
        self.showWind = showWind
        self.apiService = apiService
    }
}
