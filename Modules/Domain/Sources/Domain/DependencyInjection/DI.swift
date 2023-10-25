//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

/// Usually, Dependency Injection (DI) is managed through either compile-time or run-time mechanisms. However, for such a small project, these methods seem excessive.
/// Thus, I've created following container, to make sure that implementation is not public.
public final class DI {

    public static var fetchMovies: FetchMoviesUseCase { instance.fetchMovies }

    private lazy var fetchMovies = DefaultFetchMoviesUseCase(repository: DefaultMovieRepository())

    private static let instance = DI()

}
