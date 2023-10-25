//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Foundation

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let releaseDate: String
    let posterPath: String
}

struct MoviesListDTO: Decodable {
    let results: [MovieDTO]
}

