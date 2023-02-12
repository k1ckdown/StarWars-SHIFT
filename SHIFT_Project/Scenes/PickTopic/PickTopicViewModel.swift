//
//  PickTopicViewModel.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 29.01.2023.
//

import Foundation
import UIKit

final class PickTopicViewModel {
    
    // MARK: - Public properties
    
    var goToShowTopicScreen: ((UIViewController) -> Void)?
    
    let cellViewModels: [TopicViewCellViewModel]
    
    // MARK: - Private properties
    
    private var topics = Topics.allCases
    
    // MARK: - Inits
    
    init() {
        cellViewModels = topics.map { TopicViewCellViewModel.init(imageName: $0.nameTopic, color: $0.colorForTitle)}
    }
    
    // MARK: - Public methods
    
    func goToContentTopic(at index: Int) {
        let viewModel = ShowTopicViewModel(topic: topics[index])
        let viewController = ShowTopicViewController(viewModel: viewModel)
        goToShowTopicScreen?(viewController)
    }
}
      
