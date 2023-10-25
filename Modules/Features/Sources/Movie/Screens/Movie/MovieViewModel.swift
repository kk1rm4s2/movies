//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain

final class MovieViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var content: MovieContent

    // MARK: - Initialization

    init(movie: Movie) {
        content = movie.mappedToContent
    }

    // MARK: - API
}

extension Movie {
    fileprivate var mappedToContent: MovieContent {
        MovieContent(
            id: id,
            title: title,
            date: date, 
            description: description,
            imageURL: posterURL
        )
    }
}
