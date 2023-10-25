//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Foundation

struct MoviesListDataToDomainMapper {
    
    func map(moviesList: MoviesListDTO) -> [Movie] {
        moviesList.results.compactMap { dto in
            guard let posterURL = URL(string: "https://image.tmdb.org/t/p/w500/" + dto.posterPath) else {
                return nil
            }
            
            return Movie(
                id: dto.id,
                title: dto.title,
                description: "",
                date: String(dto.releaseDate.prefix(4)),
                posterURL: posterURL
            )
        }
    }
    
}
