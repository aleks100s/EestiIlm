import SwiftUI

public extension Image {
    func makeThumbnail() -> some View {
        resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxHeight: 100)
    }
}
