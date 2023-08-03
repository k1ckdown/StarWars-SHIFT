//
//  ContentListCoordinator.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

final class ContentListCoordinator: BaseCoordinator, AlertPresentable {
    
    private let topic: TopicType
    
    init(navigationController: UINavigationController, dependencyContainer: DependencyContainer, topic: TopicType) {
        self.topic = topic
        super.init(navigationController: navigationController, dependencyContainer: dependencyContainer)
    }
    
    override func start() {
        let viewModel = ContentListViewModel(factory: dependencyContainer, topic: topic)
        let viewController = ContentListViewController(with: viewModel)
        
        viewModel.didGoToDetailsScene = { [weak self] detailsData in
            self?.showDetailsScene(detailsData: detailsData)
        }
        
        viewModel.showReceivedError = { [weak self] description in
            self?.presentErrorAlert(with: description)
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

// MARK: - Navigation

private extension ContentListCoordinator {
    
    func showDetailsScene(detailsData: DetailsViewModelData) {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController,
                                                    dependencyContainer: dependencyContainer,
                                                    detailsData: detailsData)
        coordinate(to: detailsCoordinator)
    }
    
}
