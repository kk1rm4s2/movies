//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain

final class MoviesListViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var content = MoviesListContent.loading

    private let router: MoviesListRouter
    private let fetchMoviesUseCase: FetchMoviesUseCase

    // MARK: - Initialization

    init(router: MoviesListRouter, fetchMoviesUseCase: FetchMoviesUseCase) {
        self.router = router
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }

    // MARK: - API

    @MainActor
    func onAppear() {
        Task {
            let movies = try await fetchMoviesUseCase.execute()
            content = .list(items: movies.map(\.mappedToContent))
        }
    }

    @MainActor
    func movieTapped(_ id: Int) {
        router.movieTapped(id)
    }

}

extension Movie {
    fileprivate var mappedToContent: MoviesListItem {
        MoviesListItem(
            id: id,
            title: title,
            date: date,
            imageURL: posterURL
        )
    }
}
