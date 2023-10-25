//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain

final class DefaultMoviesListRouter: MoviesListRouter {

    // MARK: - Properties

    let action: AnyPublisher<MoviesListAction, Never>

    private let _action = PassthroughSubject<MoviesListAction, Never>()

    // MARK: - Initialization

    init() {
        action = _action.eraseToAnyPublisher()
    }

    // MARK: - MoviesListRouter

    func movieTapped(_ movie: Movie) {
        _action.send(.movieSelected(movie))
    }
}
