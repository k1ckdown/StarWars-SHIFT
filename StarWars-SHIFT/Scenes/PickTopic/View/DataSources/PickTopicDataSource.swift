//
//  PickTopicDataSource.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

final class PickTopicDataSource: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: PickTopicViewModel
    
    // MARK: - Init
    
    init(viewModel: PickTopicViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Public methods
    
    func configure(with collectionView: UICollectionView) {
        collectionView.dataSource = self
        
        collectionView.register(
            TopicViewCell.self,
            forCellWithReuseIdentifier: TopicViewCell.reuseIdentifier
        )
    }
}

extension PickTopicDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TopicViewCell.reuseIdentifier,
                for: indexPath
            ) as? TopicViewCell
        else { return .init() }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
    
}
