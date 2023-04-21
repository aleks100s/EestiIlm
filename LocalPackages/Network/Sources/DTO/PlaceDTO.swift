import Domain

public struct PlaceDTO: Codable {
    public let name: String
    public let phenomenon: String
    public let tempmin: Int?
    public let tempmax: Int?
}

public extension Place {
    init(dto: PlaceDTO) {
        self.init(
            name: dto.name,
            phenomenon: dto.phenomenon,
            minTemperature: dto.tempmin,
            maxTemperature: dto.tempmax
        )
    }
}
