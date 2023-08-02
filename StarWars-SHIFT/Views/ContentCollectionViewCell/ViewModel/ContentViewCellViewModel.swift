//
//  ContentViewCellViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation

final class ContentViewCellViewModel: ContentViewCellViewModelData {
    
    // MARK: - Public properties
    
    private(set) var name: String
    private(set) var subTitle: String
    private(set) var shouldShowSubTitle: Bool
    
    // MARK: - Init
    
    init(name: String, subTitle: String, shouldShowSubTitle: Bool) {
        self.name = name
        self.subTitle = subTitle
        self.shouldShowSubTitle = shouldShowSubTitle
    }
}
