//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain
import Infrastructure
import SwiftUI

final class MoviesListScreen: Screen {

    // MARK: - Properties

    let viewController: UIViewController
    let action: AnyPublisher<MoviesListAction, Never>

    // MARK: - Initialization
    
    convenience init() {
        let router = DefaultMoviesListRouter()
        let useCase = Domain.DI.fetchMovies
        let viewModel = MoviesListViewModel(router: router, fetchMoviesUseCase: useCase)
        let view = MoviesListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        self.init(viewController: viewController, action: router.action)
    }

    private init(viewController: UIViewController, action: AnyPublisher<MoviesListAction, Never>) {
        self.viewController = viewController
        self.action = action
    }

}
