//
//  SceneDelegate.swift
//  Movies
//
//  Created by Jakub Kiermasz on 25/10/2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties

    private let appCoordinator = AppCoordinator.instance

    // MARK: - UIWindowSceneDelegate

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.makeKeyAndVisible()
        appCoordinator.start(with: window)
    }

}
