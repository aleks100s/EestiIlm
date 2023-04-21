// swiftlint:disable:this file_name
internal extension StringProtocol where Self == String {
    static var place: String {
        String(localized: "section.place", bundle: .module, comment: "")
    }

    static var phenomenon: String {
        String(localized: "section.phenomenon", bundle: .module, comment: "")
    }

    static var generalInfo: String {
        String(localized: "section.generalInfo", bundle: .module, comment: "")
    }

    static var precipitations: String {
        String(localized: "section.precipitations", bundle: .module, comment: "")
    }

    static var temperature: String {
        String(localized: "section.temperature", bundle: .module, comment: "")
    }

    static var wind: String {
        String(localized: "section.wind", bundle: .module, comment: "")
    }
}
