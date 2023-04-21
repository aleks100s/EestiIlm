import SwiftUI

public struct DetailedText: View {
    private let leftText: String
    private let rightText: String

    public var body: some View {
        HStack {
            Text(leftText)
            Spacer()
            Text(rightText)
        }
    }

    public init(leftText: String, rightText: String) {
        self.leftText = leftText
        self.rightText = rightText
    }
}
