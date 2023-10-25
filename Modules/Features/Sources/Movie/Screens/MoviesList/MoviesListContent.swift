//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Domain
import Foundation

struct MoviesListItem: Hashable {
    let id: Int
    let title: String
    let date: String
    let imageURL: URL?
}

enum MoviesListContent: Hashable {
    case loading
    case list(items: [MoviesListItem])
}
