//
//  UICollectionViewDataSource.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

final class TopicCollectionDataSource: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: PickTopicViewModel
    
    // MARK: - Inits
    
    init(viewModel: PickTopicViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UICollectionViewDataSource

extension TopicCollectionDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicViewCell.identifier, for: indexPath) as? TopicViewCell else {
            return TopicViewCell()
        }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
}
