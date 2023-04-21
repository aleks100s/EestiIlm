import Domain
import Foundation

public struct ForecastDTO: Codable {
    public typealias NightForecastDTO = DailyForecastDTO

    public let date: String
    public let day: DailyForecastDTO
    public let night: NightForecastDTO
}

public extension Forecast {
    init(dto: ForecastDTO) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.init(
            date: dateFormatter.date(from: dto.date) ?? Date(),
            day: .init(dto: dto.day),
            night: .init(dto: dto.night)
        )
    }
}
