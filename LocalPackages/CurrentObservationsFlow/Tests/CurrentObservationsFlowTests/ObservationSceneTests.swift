@testable import ObservationScene
import XCTest

internal final class ObservationSceneTests: XCTestCase {
    private let state = ObservationState(observation: .default, isSceneLoaded: false)
    private let environment = ObservationEnvironment()

    func testSceneProducesSceneLoadedEffectWhenUserEntersScene() async throws {
        let effect = try await ObservationScene.transform(
            state: state,
            event: .userEnteredScene,
            env: environment
        )
            .firstElement()

        XCTAssertEqual(effect, .sceneLoaded, "Scene produced wrong effect")
    }

    func testSceneChangesStateCorrectlyWhenSceneLoadedEffectProduced() {
        let oldState = state

        let newState = ObservationScene.apply(state: oldState, effect: .sceneLoaded)

        XCTAssertTrue(newState.isSceneLoaded, "ObservationState.isSceneLoaded value is false")
    }
}
