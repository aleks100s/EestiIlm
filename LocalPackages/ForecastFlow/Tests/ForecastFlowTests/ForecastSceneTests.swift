import Domain
import FakeAPIServiceImpl
@testable import ForecastScene
import Library
import XCTest

internal final class ForecastSceneTests: XCTestCase {
    private let apiService = FakeAPIServiceImpl()
    private lazy var environment = ForecastEnvironment(
        apiService: apiService,
        showPlace: { _ in },
        showWind: { _ in }
    )

    func testSceneProducesSceneLoadedEffectWhenUserEntersScene() async throws {
        let effect = try await ForecastScene.transform(state: .init(), event: .userEnteredScene, env: environment)
            .firstElement()

        XCTAssertEqual(effect, .sceneLoaded([.default]), "Scene produced wrong effect")
    }

    func testSceneProducesSceneLoadedEffectWhenUserTogglesDayTime() async throws {
        let effect = try await ForecastScene.transform(state: .init(), event: .userToggledDayTime, env: environment)
            .firstElement()

        XCTAssertEqual(effect, .dayTimeChanged, "Scene produced wrong effect")
    }

    func testSceneProducesSceneLoadedEffectWhenUserSelectsDate() async throws {
        let date: Date = .now

        let effect = try await ForecastScene.transform(state: .init(), event: .userSelectedDate(date), env: environment)
            .firstElement()

        XCTAssertEqual(effect, .selectedDateChanged(date), "Scene produced wrong effect")
    }

    func testSceneProducesNothingAndCallsShowPlaceWhenUserTapsPlace() async throws {
        var showPlaceCalled = false
        let environment = ForecastEnvironment(
            apiService: apiService,
            showPlace: { _ in showPlaceCalled = true },
            showWind: { _ in }
        )

        let effect = try await ForecastScene
            .transform(state: .init(), event: .userTappedPlace(.default), env: environment)
            .firstElement()

        XCTAssertEqual(effect, .nothing, "Scene produced wrong effect")
        XCTAssertTrue(showPlaceCalled, "showPlace() wasn't called")
    }

    func testSceneProducesNothingAndCallsShowWindWhenUserTapsWind() async throws {
        var showWindCalled = false
        let environment = ForecastEnvironment(
            apiService: apiService,
            showPlace: { _ in },
            showWind: { _ in showWindCalled = true }
        )

        let effect = try await ForecastScene
            .transform(state: .init(), event: .userTappedWind(.default), env: environment)
            .firstElement()

        XCTAssertEqual(effect, .nothing, "Scene produced wrong effect")
        XCTAssertTrue(showWindCalled, "showWind() wasn't called")
    }

    func testSceneChangesStateCorrectlyWhenNothingEffectProduced() {
        let oldState = ForecastState()

        let newState = ForecastScene.apply(state: oldState, effect: .nothing)

        XCTAssertEqual(newState, oldState, "Old and new states are NOT equal")
    }

    func testSceneChangesStateCorrectlyWhenDayTimeChangedEffectProduced() {
        let oldState = ForecastState()

        let newState = ForecastScene.apply(state: oldState, effect: .dayTimeChanged)

        XCTAssertNotEqual(newState.isNight, oldState.isNight, "ForecastState.isNight property was NOT changed")
    }

    func testSceneChangesStateCorrectlyWhenSelectedDateChangedEffectProduced() {
        let date: Date = .now
        let forecast = Forecast(date: date, day: Forecast.default.day, night: Forecast.default.night)
        let oldState = ForecastState(allForecasts: [forecast], selectedForecast: nil)

        let newState = ForecastScene.apply(state: oldState, effect: .selectedDateChanged(date))

        XCTAssertEqual(newState.selectedForecast, forecast, "ForecastState.selectedForecast value is invalid")
    }

    func testSceneChangesStateCorrectlyWhenSceneLoadedEffectProduced() {
        let oldState = ForecastState(allForecasts: [])

        let newState = ForecastScene.apply(state: oldState, effect: .sceneLoaded([.default]))

        XCTAssertEqual(newState.allForecasts, [.default], "ForecastState.allForecasts value is invalid")
    }
}
