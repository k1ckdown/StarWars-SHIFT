//
//  ContentCollectionDataSource.swift
//  SHIFT_StarWars
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

final class ContentCollectionDataSource: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: ShowTopicViewModel
    private var loadingFooter = LoadingReusableView()
    
    // MARK: - Inits
    
    init(viewModel: ShowTopicViewModel) {
        self.viewModel = viewModel
        super.init()
        bindToViewModel()
    }
}

// MARK: - UICollectionViewDataSource

extension ContentCollectionDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentViewCell.identifier, for: indexPath) as? ContentViewCell else {
            return ContentViewCell()
        }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter else { return UICollectionReusableView() }
        guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadingReusableView.identifier, for: indexPath) as? LoadingReusableView else {
            return UICollectionReusableView()
        }
        
        loadingFooter = footerView
        return footerView
    }
}

// MARK: - Building ViewModel

private extension ContentCollectionDataSource {
    private func bindToViewModel() {
        viewModel.startLoadingIndicator = { [weak self] in
            self?.loadingFooter.activityIndicator.startAnimating()
        }
        
        viewModel.stopLoadingIndicator = { [weak self] in
            self?.loadingFooter.activityIndicator.stopAnimating()
        }
    }
}
