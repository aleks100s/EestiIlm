import APIService
import Domain
import Library

public final class FakeAPIServiceImpl: APIService {
    public init() {}

    public func getWeatherForecast() async throws -> [Forecast] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return [.default]
    }

    public func getCurrentObservations() async throws -> [Observation] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return [.default]
    }
}
