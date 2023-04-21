import DesignSystem
import Library
import SwiftUI

internal struct ObservationView: View {
    @ObservedObject var store: Store<ObservationState, ObservationEvent, ObservationEffect, ObservationEnvironment>

    var body: some View {
        List {
            placeSection()
            phenomenonSection()
            generalInfoSection()
        }
    }

    private func placeSection() -> some View {
        Section(.place) {
            Text(store.state.observation.name)
                .font(.title)
        }
    }

    @ViewBuilder
    private func phenomenonSection() -> some View {
        if let text = store.state.observation.phenomenon, !text.isEmpty {
            Section(.phenomenon) {
                Text(text)
            }
        }
    }

    private func generalInfoSection() -> some View {
        Section(.generalInfo) {
            DetailedText(
                leftText: .precipitations,
                rightText: store.state.observation.precipitationsDescription
            )
            DetailedText(
                leftText: .temperature,
                rightText: store.state.observation.airTemperatureDescription
            )
            DetailedText(
                leftText: .wind,
                rightText: store.state.observation.windDescription
            )
        }
    }
}

internal struct ObservationViewPreview: PreviewProvider {
    static var previews: some View {
        ObservationScene.create(with: .default)
    }
}
