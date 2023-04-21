import Domain

public struct DailyForecastDTO: Codable {
    public let phenomenon: String
    public let tempmin: Int
    public let tempmax: Int
    public let text: String
    public let sea: String?
    public let peipsi: String?
    public let places: [PlaceDTO]?
    public let winds: [WindDTO]?
}

public extension DailyForecast {
    init(dto: DailyForecastDTO) {
        self.init(
            phenomenon: dto.phenomenon,
            minTemperature: dto.tempmin,
            maxTemperature: dto.tempmax,
            generalConditions: dto.text,
            seaConditions: dto.sea,
            peipsiConditions: dto.peipsi,
            places: dto.places?.map { Place(dto: $0) },
            winds: dto.winds?.map { Wind(dto: $0) }
        )
    }
}
