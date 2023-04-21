import Foundation

@MainActor
public final class Store<State, Event, Effect, Environment>: ObservableObject {
    @Published
    public private(set) var state: State

    private let transform: (State, Event, Environment) -> AsyncStream<Effect>
    private let apply: (State, Effect) -> State
    private let environment: Environment

    public init(
        initialState state: State,
        transform: @escaping (State, Event, Environment) -> AsyncStream<Effect>,
        apply: @escaping (State, Effect) -> State,
        environment: Environment
    ) {
        self.state = state
        self.transform = transform
        self.apply = apply
        self.environment = environment
    }

    public func send(_ event: Event) {
        Task.detached { [weak self, state, environment, transform] in
            for await effect in transform(state, event, environment) {
                    await self?.apply(effect)
                }
        }
    }

    private func apply(_ effect: Effect) {
        state = apply(state, effect)
    }
}
