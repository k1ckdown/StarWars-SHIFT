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
    
    // MARK: - Inits
    
    init(viewModel: PickTopicViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Public methods
    
    func configure(with collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TopicViewCell.self, forCellWithReuseIdentifier: TopicViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension PickTopicDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TopicViewCell.identifier,
                for: indexPath
            ) as? TopicViewCell
        else { return .init() }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PickTopicDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToContentTopic(at: indexPath.item)
    }
}
