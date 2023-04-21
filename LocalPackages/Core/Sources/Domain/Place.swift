public struct Place {
    public let name: String
    public let phenomenon: String
    public let minTemperature: Int?
    public let maxTemperature: Int?

    public init(name: String, phenomenon: String, minTemperature: Int?, maxTemperature: Int?) {
        self.name = name
        self.phenomenon = phenomenon
        self.minTemperature = minTemperature
        self.maxTemperature = maxTemperature
    }
}

public extension Place {
    var maxTemperatureDescription: String {
        "\(maxTemperature ?? 0)°C"
    }

    var minTemperatureDescription: String {
        "\(minTemperature ?? 0)°C"
    }
}

extension Place: Identifiable {
    public var id: String {
        name
    }
}

extension Place: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
