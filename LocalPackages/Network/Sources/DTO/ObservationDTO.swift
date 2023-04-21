import Domain

public struct ObservationDTO: Codable {
    public let name: String
    public let wmocode: String
    public let longitude: String
    public let latitude: String
    public let phenomenon: String
    public let visibility: String
    public let precipitations: String
    public let airpressure: String
    public let relativehumidity: String
    public let airtemperature: String
    public let winddirection: String
    public let windspeed: String
    public let windspeedmax: String
    public let waterlevel: String
    // swiftlint:disable:next identifier_name
    public let waterlevel_eh2000: String
    public let watertemperature: String
    public let uvindex: String
}

public extension Observation {
    init(dto: ObservationDTO) {
        self.init(
            name: dto.name,
            wmoCode: Int(dto.wmocode),
            longitude: Double(dto.longitude) ?? 0,
            latitude: Double(dto.latitude) ?? 0,
            phenomenon: dto.phenomenon,
            visibility: Float(dto.visibility),
            precipitations: Float(dto.precipitations),
            airPressure: Float(dto.airpressure),
            relativeHumidity: Int(dto.relativehumidity),
            airTemperature: Float(dto.airtemperature),
            windDirection: Int(dto.winddirection),
            windSpeed: Float(dto.windspeed),
            maxWindSpeed: Float(dto.windspeedmax),
            waterLevel: Int(dto.waterlevel),
            waterlevelEH2000: Int(dto.waterlevel_eh2000),
            waterTemperature: Float(dto.watertemperature),
            uvIndex: Int(dto.uvindex)
        )
    }
}
