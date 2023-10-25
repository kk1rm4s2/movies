//
//  SceneDelegate.swift
//  Movies
//
//  Created by Jakub Kiermasz on 25/10/2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    internal var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
