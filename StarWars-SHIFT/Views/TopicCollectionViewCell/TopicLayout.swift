//
//  TopicLayout.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 30.01.2023.
//

import UIKit

class TopicLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }

        scrollDirection = .vertical
        
        minimumLineSpacing = 45
        minimumInteritemSpacing = 45
        
        sectionInset.left = 18
        sectionInset.right = 18
        
        let itemsInRow = 2
        let sideInsets = sectionInset.left * 2
        let lineInsets = minimumInteritemSpacing * CGFloat(itemsInRow - 1) + sideInsets
        let otherSpace = collectionView.frame.width - lineInsets
        let cellWidth = otherSpace / CGFloat(itemsInRow)
        itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        sectionInset.top = (collectionView.frame.height - collectionViewContentSize.height) / 2 + 20
    }
}
