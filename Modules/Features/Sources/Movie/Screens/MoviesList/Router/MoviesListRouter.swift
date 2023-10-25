//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain

protocol MoviesListRouter: AnyObject {

    func movieTapped(_ movie: Movie)

}
