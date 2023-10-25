//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain
import Infrastructure
import SwiftUI

final class MovieScreen: Screen {

    // MARK: - Properties

    let viewController: UIViewController

    // MARK: - Initialization

    convenience init(movie: Movie) {
        let viewModel = MovieViewModel(movie: movie)
        let view = MovieView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        self.init(viewController: viewController)
    }

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

}
