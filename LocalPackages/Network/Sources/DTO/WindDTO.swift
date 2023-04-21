import Domain

public struct WindDTO: Codable {
    public let name: String
    public let direction: String
    public let speedmin: Int
    public let speedmax: Int
}

public extension Wind {
    init(dto: WindDTO) {
        self.init(
            name: dto.name,
            direction: dto.direction,
            minSpeed: dto.speedmin,
            maxSpeed: dto.speedmax
        )
    }
}
