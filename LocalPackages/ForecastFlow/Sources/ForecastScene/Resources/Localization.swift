// swiftlint:disable:this file_name
internal extension StringProtocol where Self == String {
    static var night: String {
        String(localized: "label.night", bundle: .module, comment: "")
    }

    static var day: String {
        String(localized: "label.day", bundle: .module, comment: "")
    }

    static var generalConditions: String {
        String(localized: "section.generalConditions", bundle: .module, comment: "")
    }

    static var seaConditions: String {
        String(localized: "section.seaConditions", bundle: .module, comment: "")
    }

    static var peipsiConditions: String {
        String(localized: "section.peipsiConditions", bundle: .module, comment: "")
    }

    static var places: String {
        String(localized: "section.places", bundle: .module, comment: "")
    }

    static var winds: String {
        String(localized: "section.winds", bundle: .module, comment: "")
    }

    static var forecast: String {
        String(localized: "title.forecast", bundle: .module, comment: "")
    }

    static var dayNight: String {
        String(localized: "button.toggleDayNight", bundle: .module, comment: "")
    }

    static var selectDate: String {
        String(localized: "button.selectDate", bundle: .module, comment: "")
    }
}
