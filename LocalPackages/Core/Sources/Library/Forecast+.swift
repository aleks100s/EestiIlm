import Domain

// swiftlint:disable line_length
public extension Forecast {
    static let `default`: Self = Forecast(
        date: .now,
        day: .init(phenomenon: "Variable clouds",
                   minTemperature: 22,
                   maxTemperature: 28,
                   generalConditions: "Slightly or partly cloudy and mainly dry. Variable wind 1-6 m/s. Air temperature 28..32, on the windward coastto 22°C.",
                   seaConditions: "Forecast for Baltic Sea valid 24 hours from 19:00 Jun 25 to 19:00 UTC Jun 26, 2022.\n\nWeather summary: stationary High over Finland and Baltic States.\n\nNo warnings\n\n\nNorthern Baltic, Northern Gulf of Riga: mainly southeast 3-8 m/s. Dry. Visibility mostly good.\n\nGulf of Finland, Moonsund: variable 2-7 m/s. Dry. Visibility mostly good.\n",
                   peipsiConditions: "Variable wind 1-5 m/s. Wave height to 0.5 m. Dry. Visibility good. Air temperature 22..25°C.",
                   places: [
                       .init(name: "Harku", phenomenon: "Variable clouds", minTemperature: 11, maxTemperature: nil),
                       .init(name: "Jõhvi", phenomenon: "Variable clouds", minTemperature: nil, maxTemperature: 30),
                       .init(name: "Tartu", phenomenon: "Few clouds", minTemperature: nil, maxTemperature: 31)
                   ],
                   winds: nil),
        night: .init(phenomenon: "Few clouds",
                     minTemperature: 13,
                     maxTemperature: 18,
                     generalConditions: "Clear or slightly cloudy and dry. Fog is possible locally. Variable wind 1-5 m/s. Air temperature 13..18°C",
                     seaConditions: "Forecast for Baltic Sea valid 24 hours from 19:00 Jun 25 to 19:00 UTC Jun 26, 2022.\n\nWeather summary: stationary High over Finland and Baltic States.\n\nNo warnings\n\n\nNorthern Baltic, Northern Gulf of Riga: mainly southeast 3-8 m/s. Dry. Visibility mostly good.\n\nGulf of Finland, Moonsund: variable 2-7 m/s. Dry. Visibility mostly good.\n",
                     peipsiConditions: "Variable wind 1-5 m/s. Wave height to 0.5 m. Dry. Visibility mostly good, fog possible locally. Air temperature 15..17°C.",
                     places: nil,
                     winds: [
                         .init(name: "Kuusiku", direction: "Northeast wind", minSpeed: 1, maxSpeed: 5),
                         .init(name: "Väike-Maarja", direction: "Southwest wind", minSpeed: 1, maxSpeed: 4),
                         .init(name: "Võrtsjärv", direction: "South wind", minSpeed: 2, maxSpeed: 5)
                     ])
    )
}
