//
//  UICollectionViewDelegate.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

final class TopicCollectionDelegate: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: PickTopicViewModel
    
    // MARK: - Inits
    
    init(viewModel: PickTopicViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UICollectionViewDelegate

extension TopicCollectionDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToContentTopic(at: indexPath.item)
    }
}
