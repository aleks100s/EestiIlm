@testable import CurrentObservationsScene
import FakeAPIServiceImpl
import XCTest

internal final class CurrentObservationsSceneTests: XCTestCase {
    private let apiService = FakeAPIServiceImpl()
    private let state = CurrentObservationsState(isSceneLoaded: false, observations: [])
    private lazy var environment = CurrentObservationsEnvironment(apiService: apiService, showObservation: { _ in })

    func testSceneProducesSceneLoadedEffectWhenUserEntersScene() async throws {
        let effect = try await CurrentObservationsScene.transform(
            state: state,
            event: .userEnteredScene,
            env: environment
        )
            .firstElement()

        XCTAssertEqual(effect, .sceneLoaded, "Scene produced wrong effect")
    }

    func testSceneProducesNothingEffectWhenUserTapsObservation() async throws {
        let effect = try await CurrentObservationsScene.transform(
            state: state,
            event: .userTappedObservation(.default),
            env: environment
        )
            .firstElement()

        XCTAssertEqual(effect, .nothing, "Scene produced wrong effect")
    }

    func testSceneChangesStateCorrectlyWhenSceneLoadedEffectProduced() {
        let oldState = state

        let newState = CurrentObservationsScene.apply(state: oldState, effect: .sceneLoaded)

        XCTAssertTrue(newState.isSceneLoaded, "CurrentObservationsState.isSceneLoaded value is false")
    }

    func testSceneChangesStateCorrectlyWhenObservationsLoadedEffectProduced() {
        let oldState = state

        let newState = CurrentObservationsScene.apply(state: oldState, effect: .observationsLoaded([.default]))

        XCTAssertEqual(newState.observations, [.default], "CurrentObservationsState.observations value is invalid")
    }

    func testSceneChangesStateCorrectlyWhenNothingEffectProduced() {
        let oldState = state

        let newState = CurrentObservationsScene.apply(state: oldState, effect: .nothing)

        XCTAssertEqual(oldState, newState, "Old and new states are not equal")
    }
}
