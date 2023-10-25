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

    private var movies: [Movie]? { didSet { updateContent() } }

    // MARK: - Initialization

    init(router: MoviesListRouter, fetchMoviesUseCase: FetchMoviesUseCase) {
        self.router = router
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }

    // MARK: - API

    @MainActor
    func onAppear() {
        Task {
            movies = try await fetchMoviesUseCase.execute()
        }
    }

    @MainActor
    func movieTapped(_ id: Int) {
        guard let movie = movies?.first(where: { suspect in suspect.id == id }) else { return }
        router.movieTapped(movie)
    }

    // MARK: - Private

    func updateContent() {
        guard let movies else { return }
        content = .list(items: movies.map(\.mappedToContent))
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
