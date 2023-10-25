//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

protocol MovieRepository {

    func fetchMovies() async throws -> [Movie]

}
