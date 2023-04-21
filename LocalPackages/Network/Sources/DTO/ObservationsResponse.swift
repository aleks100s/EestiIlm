import Domain
import Foundation

public struct ObservationsResponse: Codable {
    public let timestamp: String
    public let observations: [ObservationDTO]
}

public extension CurrentObservations {
    init(dto: ObservationsResponse) {
        self.init(
            timestamp: Date(timeIntervalSince1970: Double(dto.timestamp) ?? 0),
            observations: dto.observations.map { Observation(dto: $0) }
        )
    }
}
