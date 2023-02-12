//
//  ContentViewCellViewModel.swift
//  SHIFT_StarWars
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation

protocol ContentViewCellViewModelData {
    var name: String { get }
    var subTitle: String { get }
    var shouldShowSubTitle: Bool { get }
}

final class ContentViewCellViewModel: ContentViewCellViewModelData {
    
    // MARK: - Public properties
    
    let name: String
    let subTitle: String
    var shouldShowSubTitle: Bool
    
    // MARK: - Inits
    
    init(name: String, subTitle: String, shouldShowSubTitle: Bool) {
        self.name = name
        self.subTitle = subTitle
        self.shouldShowSubTitle = shouldShowSubTitle
    }
}
