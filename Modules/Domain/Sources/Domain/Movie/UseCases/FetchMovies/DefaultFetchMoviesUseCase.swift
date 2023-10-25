//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Foundation

final class DefaultFetchMoviesUseCase: FetchMoviesUseCase {

    // MARK: - Properties

    private let repository: MovieRepository

    // MARK: - Initialization

    init(repository: MovieRepository) {
        self.repository = repository
    }

    // MARK: - FetchMoviesUseCase

    func execute() async throws -> [Movie] {
        try await repository.fetchMovies()
    }
    
}
