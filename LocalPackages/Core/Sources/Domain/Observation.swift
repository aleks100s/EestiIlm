import CoreLocation

public struct Observation {
    public let name: String
    public let wmoCode: Int?
    public let longitude: Double
    public let latitude: Double
    public let phenomenon: String?
    public let visibility: Float?
    public let precipitations: Float?
    public let airPressure: Float?
    public let relativeHumidity: Int?
    public let airTemperature: Float?
    public let windDirection: Int?
    public let windSpeed: Float?
    public let maxWindSpeed: Float?
    public let waterLevel: Int?
    public let waterlevelEH2000: Int?
    public let waterTemperature: Float?
    public let uvIndex: Int?

    public init(
        name: String,
        wmoCode: Int?,
        longitude: Double,
        latitude: Double,
        phenomenon: String?,
        visibility: Float?,
        precipitations: Float?,
        airPressure: Float?,
        relativeHumidity: Int?,
        airTemperature: Float?,
        windDirection: Int?,
        windSpeed: Float?,
        maxWindSpeed: Float?,
        waterLevel: Int?,
        waterlevelEH2000: Int?,
        waterTemperature: Float?,
        uvIndex: Int?
    ) {
        self.name = name
        self.wmoCode = wmoCode
        self.longitude = longitude
        self.latitude = latitude
        self.phenomenon = phenomenon
        self.visibility = visibility
        self.precipitations = precipitations
        self.airPressure = airPressure
        self.relativeHumidity = relativeHumidity
        self.airTemperature = airTemperature
        self.windDirection = windDirection
        self.windSpeed = windSpeed
        self.maxWindSpeed = maxWindSpeed
        self.waterLevel = waterLevel
        self.waterlevelEH2000 = waterlevelEH2000
        self.waterTemperature = waterTemperature
        self.uvIndex = uvIndex
    }
}

public extension Observation {
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var airTemperatureDescription: String {
        "\(airTemperature ?? 0)°C"
    }

    var precipitationsDescription: String {
        "\(precipitations ?? 0) mm"
    }

    var windDescription: String {
        "\(windSpeed ?? 0) - \(maxWindSpeed ?? 0) m/s"
    }
}

extension Observation: Identifiable {
    public var id: String {
        name
    }
}

extension Observation: Equatable {
    public static func == (lhs: Observation, rhs: Observation) -> Bool {
        lhs.name == rhs.name
    }
}
