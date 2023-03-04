//
//  ContentLayout.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.02.2023.
//

import UIKit

class ContentLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }

        scrollDirection = .vertical
        
        minimumLineSpacing = 35
        minimumInteritemSpacing = 35
        
        sectionInset.left = 18
        sectionInset.right = 18
        
        let itemsInRow = 2
        let sideInsets = sectionInset.left * 2
        let lineInsets = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sideInsets
        let otherSpace = collectionView.frame.width - lineInsets
        let cellWidth = otherSpace / CGFloat(itemsInRow)
        itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        
        footerReferenceSize = CGSize(width: 50, height: 50)
        
        sectionInset.top = 15
    }
    
}
