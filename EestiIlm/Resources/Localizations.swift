// swiftlint:disable:this file_name
internal extension StringProtocol where Self == String {
    static var forecast: String {
        String(localized: "flow.forecast", bundle: .main, comment: "")
    }

    static var currentObservations: String {
        String(localized: "flow.currentObservations", bundle: .main, comment: "")
    }
}
