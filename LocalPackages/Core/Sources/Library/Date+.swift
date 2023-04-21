import Foundation

extension Date: Identifiable {
    public var id: Double {
        timeIntervalSince1970
    }
}

public extension Date {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter
    }()

    var stringRepresentation: String {
        Self.dateFormatter.string(from: self)
    }
}
