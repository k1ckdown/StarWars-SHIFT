//
//  ContentCollectionDataSource.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

final class ShowTopicDataSource: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: ShowTopicViewModel
    private var loadingFooter = LoadingReusableView()
    
    // MARK: - Inits
    
    init(viewModel: ShowTopicViewModel) {
        self.viewModel = viewModel
        super.init()
        bindToViewModel()
    }
    
    // MARK: - Public methods
    
    func configure(with collectionView: UICollectionView) {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            ContentViewCell.self,
            forCellWithReuseIdentifier: ContentViewCell.identifier
        )
        
        collectionView.register(
            LoadingReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadingReusableView.identifier
        )
    }
}

// MARK: - UICollectionViewDataSource

extension ShowTopicDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentViewCell.identifier,
                for: indexPath
            ) as? ContentViewCell
        else { return .init() }
        
        cell.configure(with: viewModel.cellViewModels[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard
            kind == UICollectionView.elementKindSectionFooter,
            let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LoadingReusableView.identifier,
                for: indexPath
            ) as? LoadingReusableView
        else { return .init() }
        
        loadingFooter = footerView
        return footerView
    }
}

// MARK: - UICollectionViewDelegate

extension ShowTopicDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToDetailScreen(for: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.startDownloadingData(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        guard elementKind == UICollectionView.elementKindSectionFooter else { return }
        
        viewModel.checkDownloadStatus()
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        guard elementKind == UICollectionView.elementKindSectionFooter else { return }

        viewModel.checkDownloadStatus()
    }
}

// MARK: - Building ViewModel

private extension ShowTopicDataSource {
    func bindToViewModel() {
        viewModel.startLoadingIndicator = { [weak self] in
            self?.loadingFooter.activityIndicator.startAnimating()
        }
        
        viewModel.stopLoadingIndicator = { [weak self] in
            self?.loadingFooter.activityIndicator.stopAnimating()
        }
    }
}
