import APIService
import APIServiceImpl
import SwiftUI

@main
internal struct EestiIlmApp: App {
    private let apiService: APIService = APIServiceImpl()

    var body: some Scene {
        WindowGroup {
            AppRoot(apiService: apiService)
        }
    }
}
