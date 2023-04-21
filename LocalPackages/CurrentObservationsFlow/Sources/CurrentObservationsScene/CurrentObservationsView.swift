import FakeAPIServiceImpl
import Library
import MapKit
import SwiftUI

internal struct CurrentObservationsView: View {
    @ObservedObject var store: Store<
        CurrentObservationsState,
        CurrentObservationsEvent,
        CurrentObservationsEffect,
        CurrentObservationsEnvironment
    >

    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 58.378, longitude: 26.729),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: store.state.observations) { observation in
            MapAnnotation(coordinate: observation.coordinate) {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 44, height: 44)

                    Circle()
                        .stroke(.blue, lineWidth: 2)
                        .frame(width: 44, height: 44)

                    Text(observation.airTemperatureDescription)
                        .font(.system(size: 10))
                        .frame(width: 40, height: 40)
                }
                .onTapGesture {
                    store.send(.userTappedObservation(observation))
                }
            }
        }
        .onAppear {
            store.send(.userEnteredScene)
        }
    }
}

internal struct CurrentObservationsViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CurrentObservationsScene.create(with: FakeAPIServiceImpl(), showObservation: { _ in })
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
