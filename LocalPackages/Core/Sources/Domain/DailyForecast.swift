public struct DailyForecast {
    public let phenomenon: String
    public let minTemperature: Int
    public let maxTemperature: Int
    public let generalConditions: String
    public let seaConditions: String?
    public let peipsiConditions: String?
    public let places: [Place]?
    public let winds: [Wind]?

    public init(
        phenomenon: String,
        minTemperature: Int,
        maxTemperature: Int,
        generalConditions: String,
        seaConditions: String?,
        peipsiConditions: String?,
        places: [Place]?,
        winds: [Wind]?
    ) {
        self.phenomenon = phenomenon
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
        self.generalConditions = generalConditions
        self.seaConditions = seaConditions
        self.peipsiConditions = peipsiConditions
        self.places = places
        self.winds = winds
    }
}

public extension DailyForecast {
    var maxTemperatureDescription: String {
        "\(maxTemperature)°C"
    }

    var minTemperatureDescription: String {
        "\(minTemperature)°C"
    }
}
