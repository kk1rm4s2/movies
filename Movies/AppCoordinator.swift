//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import Movie
import Infrastructure
import UIKit

final class AppCoordinator {

    // MARK: - Properties

    /// To make sure only one instance exists at the time. Should not be accessed more than once.
    public static let instance = AppCoordinator()

    private let navigationController =  UINavigationController()

    private var window: UIWindow?
    private var childCoordinator: Coordinator? {
        didSet {
            childCoordinator?.start()
        }
    }

    // MARK: - API

    func start(with window: UIWindow) {
        self.window = window
        startDashboardCoordinator()
    }

    // MARK: - Private

    private func startDashboardCoordinator() {
        let coordinator = MoviesCoordinator(navigationController: navigationController)
        childCoordinator = coordinator
        window?.rootViewController = navigationController
    }

}
