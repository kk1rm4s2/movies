//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine

final class MoviesListViewModel: ObservableObject {

    // MARK: - Properties

    private let router: MoviesListRouter

    // MARK: - Initialization

    init(router: MoviesListRouter) {
        self.router = router
    }

    // MARK: - API

    @MainActor
    func movieTapped(_ id: Int) {
        router.movieTapped(id)
    }

}
