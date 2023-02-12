//
//  ContentCollectionDelegate.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

final class ContentCollectionDelegate: NSObject {
    
    // MARK: - Private properties
    
    private let viewModel: ShowTopicViewModel
    
    // MARK: - Inits
    
    init(viewModel: ShowTopicViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UICollectionViewDelegate

extension ContentCollectionDelegate: UICollectionViewDelegate {
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


