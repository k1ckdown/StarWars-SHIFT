//
//  SceneDelegate.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 29.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let viewController = StartScreenViewController(viewModel: StartViewModel())
        let navController = UINavigationController(rootViewController: viewController)
        navController.overrideUserInterfaceStyle = .dark
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
}

