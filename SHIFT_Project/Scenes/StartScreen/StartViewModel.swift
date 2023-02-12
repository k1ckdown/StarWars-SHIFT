//
//  StartScreenViewModel.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 30.01.2023.
//

import Foundation
import UIKit

final class StartViewModel {
    
    // MARK: - Public properties
    
    var goToShowTopicScreen: ((UIViewController) -> Void)?
    
    // MARK: - Public methods
    
    func goToSelectionTopics() {
        let viewModel = PickTopicViewModel()
        let viewController = PickTopicViewController(viewModel: viewModel)
        goToShowTopicScreen?(viewController)
    }
}
