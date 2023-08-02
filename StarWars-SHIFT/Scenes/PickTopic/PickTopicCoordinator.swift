//
//  PickTopicCoordinator.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

final class PickTopicCoordinator: BaseCoordinator {
    
    override init(navigationController: UINavigationController) {
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let viewModel = PickTopicViewModel()
        let viewController = PickTopicViewController(with: viewModel)
        
        viewModel.didGoToContentList = { [weak self] topic in
            self?.showContentListScene(topic: topic)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

private extension PickTopicCoordinator {
    
    func showContentListScene(topic: TopicType) {
        let contentListCoordinator = ContentListCoordinator(navigationController: navigationController, topic: topic)
        coordinate(to: contentListCoordinator)
    }
    
}
