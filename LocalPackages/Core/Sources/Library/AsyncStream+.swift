public extension AsyncStream {
    func firstElement() async throws -> Element? {
        var firstElement: Element?
        for try await element in self {
            firstElement = element
            break
        }
        return firstElement
    }
}
