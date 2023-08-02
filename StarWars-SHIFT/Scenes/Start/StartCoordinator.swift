//
//  StartCoordinator.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

final class StartCoordinator: BaseCoordinator {
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let viewModel = StartViewModel()
        let viewController = StartViewController(with: viewModel)
        
        viewModel.didGoToPickTopicScene = { [weak self] in
            self?.showPickTopicScene()
        }
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
}

private extension StartCoordinator {
    
    func showPickTopicScene() {
        let pickTopicCoordinator = PickTopicCoordinator(navigationController: navigationController)
        coordinate(to: pickTopicCoordinator)
    }
    
}
