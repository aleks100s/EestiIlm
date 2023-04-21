@testable import DTO
import Foundation
import XCTest

internal final class DTOTests: XCTestCase {
    private let decoder = JSONDecoder()

    func testForecastResponseDecoding() {
        let url = Bundle.module.bundleURL.appendingPathComponent("forecast.json")
        var data: Data!
        XCTAssertNoThrow(data = try Data(contentsOf: url))
        XCTAssertNoThrow(
            try decoder.decode(
                ForecastResponse.self,
                from: data
            )
        )
    }

    func testObservationsResponseDecoding() {
        let url = Bundle.module.bundleURL.appendingPathComponent("observations.json")
        var data: Data!
        XCTAssertNoThrow(data = try Data(contentsOf: url))
        XCTAssertNoThrow(
            try decoder.decode(
                ObservationsResponse.self,
                from: data
            )
        )
    }
}
