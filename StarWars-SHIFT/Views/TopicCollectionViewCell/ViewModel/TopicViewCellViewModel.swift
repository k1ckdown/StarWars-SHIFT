//
//  TopicViewCellViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation

final class TopicViewCellViewModel {
    
    // MARK: - Public properties
    
    private(set) var topicStyle: TopicViewCellStyle
    
    // MARK: - Init
    
    init(topicStyle: TopicViewCellStyle) {
        self.topicStyle = topicStyle
    }
}
