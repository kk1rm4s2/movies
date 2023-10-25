//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine

final class DefaultMoviesListRouter: MoviesListRouter {

    // MARK: - Properties

    let action: AnyPublisher<MoviesListAction, Never>

    private let _action = PassthroughSubject<MoviesListAction, Never>()

    // MARK: - Initialization

    init() {
        action = _action.eraseToAnyPublisher()
    }

    // MARK: - MoviesListRouter

    func movieTapped(_ id: Int) {
        _action.send(.movieSelected(id))
    }
}
