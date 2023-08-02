//
//  ContentListCoordinator.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

final class ContentListCoordinator: BaseCoordinator, AlertPresentable {
    
    private let topic: TopicType
    
    init(navigationController: UINavigationController, topic: TopicType) {
        self.topic = topic
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let viewModel = ContentListViewModel(topic: topic)
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

private extension ContentListCoordinator {
    
    func showDetailsScene(detailsData: DetailsViewModelData) {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController, detailsData: detailsData)
        coordinate(to: detailsCoordinator)
    }
    
}
