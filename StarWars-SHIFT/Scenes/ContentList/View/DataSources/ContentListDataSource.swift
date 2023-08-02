//
//  ContentCollectionDataSource.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import UIKit

final class ContentListDataSource: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: ContentListViewModel
    private var loadingFooter = LoadingReusableView()
    
    // MARK: - Inits
    
    init(viewModel: ContentListViewModel) {
        self.viewModel = viewModel
        super.init()
        bindToViewModel()
    }
    
    // MARK: - Public methods
    
    func configure(with collectionView: UICollectionView) {
        collectionView.dataSource = self
        
        collectionView.register(
            ContentViewCell.self,
            forCellWithReuseIdentifier: ContentViewCell.reuseIdentifier
        )
        
        collectionView.register(
            LoadingReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadingReusableView.reuseIdentifier
        )
    }
}

extension ContentListDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentViewCell.reuseIdentifier,
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
                withReuseIdentifier: LoadingReusableView.reuseIdentifier,
                for: indexPath
            ) as? LoadingReusableView
        else { return .init() }
        
        loadingFooter = footerView
        return footerView
    }
    
}

// MARK: - Building ViewModel

private extension ContentListDataSource {
    func bindToViewModel() {
        viewModel.showLoadingIndicator = { [weak self] in
            self?.loadingFooter.start()
        }
        
        viewModel.hideLoadingIndicator = { [weak self] in
            self?.loadingFooter.stop()
        }
    }
}
