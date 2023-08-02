//
//  AppCoordinator.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init(navigationController: .init())
    }
    
    override func start() {
        window.overrideUserInterfaceStyle = .dark
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        showStartScene()
    }
}

private extension AppCoordinator {
    
    func showStartScene() {
        let startCoordinator = StartCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
    
}
