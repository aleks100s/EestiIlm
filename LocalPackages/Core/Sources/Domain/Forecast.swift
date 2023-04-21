import Foundation

public struct Forecast {
    public typealias NightForecast = DailyForecast

    public let date: Date
    public let day: DailyForecast
    public let night: NightForecast

    public init(date: Date, day: DailyForecast, night: Forecast.NightForecast) {
        self.date = date
        self.day = day
        self.night = night
    }
}

extension Forecast: Equatable {
    public static func == (lhs: Forecast, rhs: Forecast) -> Bool {
        lhs.date == rhs.date
    }
}
