import Domain

public protocol APIService {
    func getWeatherForecast() async throws -> [Forecast]
    func getCurrentObservations() async throws -> [Observation]
}
