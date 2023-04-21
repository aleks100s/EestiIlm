import APIService
import Domain
import DTO
import Foundation
import Library

public final class APIServiceImpl: APIService {
    private let weatherForecastUrl = "https://weather.aw.ee/api/estonia/forecast"
    private let currentObservationsUrl = "https://weather.aw.ee/api/estonia/current"
    private let urlSession = URLSession.shared
    private let decoder = JSONDecoder()

    public init() {}

    public func getWeatherForecast() async throws -> [Forecast] {
        let data = try await fetchData(with: weatherForecastUrl)
        let forecasts: [Forecast] = try decoder.decode(ForecastResponse.self, from: data)
            .forecasts.map { .init(dto: $0) }
        return forecasts
    }

    public func getCurrentObservations() async throws -> [Observation] {
        let data = try await fetchData(with: currentObservationsUrl)
        let observations: [Observation] = try decoder.decode(ObservationsResponse.self, from: data)
            .observations.map { .init(dto: $0) }
        return observations
    }

    private func fetchData(with url: String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw "Invalid url: \(url)"
        }

        let (data, response) = try await urlSession.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw "Invalid response: \(response.description)"
        }

        return data
    }
}
