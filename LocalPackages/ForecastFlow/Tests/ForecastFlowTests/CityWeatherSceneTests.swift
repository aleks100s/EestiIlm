@testable import CityWeatherScene
import Domain
import Library
import XCTest

internal final class CityWeatherSceneTests: XCTestCase {
    func testSceneProducesSceneLoadedEffectWhenUserEntersScene() async throws {
        let effect = try await CityWeatherScene.transform(
            state: CityWeatherState(place: .default, wind: nil),
            event: .userEnteredScene,
            environment: CityWeatherEnvironment()
        )
            .firstElement()

        XCTAssertEqual(effect, .sceneLoaded, "Scene produced wrong effect")
    }

    func testSceneChangesStateCorrectlyWhenSceneLoadedEffectProduced() {
        let oldState = CityWeatherState(place: .default, wind: nil, isSceneLoaded: false)

        let newState = CityWeatherScene.apply(state: oldState, effect: .sceneLoaded)

        XCTAssertTrue(newState.isSceneLoaded, "CityWeatherState.isSceneLoaded value is false")
    }
}
