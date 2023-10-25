//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Combine
import Domain
import Infrastructure
import UIKit

public final class MoviesCoordinator: Coordinator {

    // MARK: - Properties

    private let navigationController: UINavigationController

    private var container = Set<AnyCancellable>()

    // MARK: - Initialization

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Flow

    public func start() {
        presentMoviesList()
    }

    // MARK: - Private

    private func presentMoviesList() {
        let screen = MoviesListScreen()
        screen.action.sink { [weak self] action in
            switch action {
            case .movieSelected(let movie): self?.presentMovie(movie)
            }
        }.store(in: &container)
        // TODO: Move to extensions
        navigationController.setViewControllers([screen.viewController], animated: false)
    }

    private func presentMovie(_ movie: Movie) {
        let screen = MovieScreen(movie: movie)
        navigationController.pushViewController(screen.viewController, animated: true)
    }

}
