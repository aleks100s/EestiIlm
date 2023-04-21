import SwiftUI

public struct WeatherView: View {
    private let thumbnailImageName: String
    private let mainText: String
    private let labelImageName: String
    private let labelText: String

    public var body: some View {
        VStack(spacing: 16) {
            Image(systemName: thumbnailImageName)
                .makeThumbnail()

            Text(mainText)
                .font(.title)

            Label(labelText, systemImage: labelImageName)
        }
    }

    public init(
        thumbnailImageName: String,
        mainText: String,
        labelImageName: String,
        labelText: String
    ) {
        self.thumbnailImageName = thumbnailImageName
        self.mainText = mainText
        self.labelImageName = labelImageName
        self.labelText = labelText
    }
}
