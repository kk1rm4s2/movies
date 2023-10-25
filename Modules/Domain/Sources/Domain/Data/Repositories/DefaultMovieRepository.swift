//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Foundation

final class DefaultMovieRepository: MovieRepository {

    // MARK: - Properties

    private let session: URLSession

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private let mapper = MoviesListDataToDomainMapper()

    // MARK: - Initialization

    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - FetchMoviesUseCase

    func fetchMovies() async throws -> [Movie] {
        let request = makeRequest()
        let (data, _) = try await session.data(for: request)

        let dto = try decoder.decode(MoviesListDTO.self, from: data)
        return mapper.map(moviesList: dto)
    }

    // MARK: - Private

    private func makeRequest() -> URLRequest {
        // Normally such key should not be placed in the code.
        // Using `.xcconfig` file to store it is a good idea
        let key = "c9856d0cb57c3f14bf75bdc6c063b8f3"
        let queryItems = [URLQueryItem(name: "api_key", value: key)]
        var components = URLComponents(string: "https://api.themoviedb.org/3/discover/movie")

        components?.queryItems = queryItems

        let url = components!.url!
        var request = URLRequest(url: url)

        let headers = ["accept": "application/json"]
        request.allHTTPHeaderFields = headers

        return request
    }

}
