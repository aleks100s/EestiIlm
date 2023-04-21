public struct Wind {
    public let name: String
    public let direction: String
    public let minSpeed: Int
    public let maxSpeed: Int

    public init(name: String, direction: String, minSpeed: Int, maxSpeed: Int) {
        self.name = name
        self.direction = direction
        self.minSpeed = minSpeed
        self.maxSpeed = maxSpeed
    }
}

public extension Wind {
    var maxSpeedDescription: String {
        "\(maxSpeed) m/s"
    }

    var minSpeedDescription: String {
        "\(minSpeed) m/s"
    }

    var speedDescription: String {
        "\(minSpeed) - \(maxSpeed) m/s"
    }
}

extension Wind: Identifiable {
    public var id: String {
        name
    }
}

extension Wind: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
