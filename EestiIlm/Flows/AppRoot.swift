import APIService
import SwiftUI

internal struct AppRoot: View {
    private let apiService: APIService

    var body: some View {
        TabView {
            ForecastFlow(apiService: apiService)
                .tabItem {
                    Label(.forecast, systemImage: "moon.fill")
                }

            CurrentObservationsFlow(apiService: apiService)
                .tabItem {
                    Label(.currentObservations, systemImage: "sun.max.fill")
                }
        }
    }

    internal init(apiService: APIService) {
        self.apiService = apiService
    }
}
