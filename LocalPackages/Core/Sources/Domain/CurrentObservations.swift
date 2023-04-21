import Foundation

public struct CurrentObservations {
    public let timestamp: Date
    public let observations: [Observation]

    public init(timestamp: Date, observations: [Observation]) {
        self.timestamp = timestamp
        self.observations = observations
    }
}
