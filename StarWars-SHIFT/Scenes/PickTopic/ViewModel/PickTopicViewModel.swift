//
//  PickTopicViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 29.01.2023.
//

import Foundation

final class PickTopicViewModel {
    
    // MARK: - Public properties
    
    var didGoToContentList: ((TopicType) -> Void)?
    private(set) var sceneTitle = "Topics"
    private(set) var cellViewModels: [TopicViewCellViewModel]
    
    // MARK: - Private properties
    
    private var topics = TopicType.allCases
    
    // MARK: - Inits
    
    init() {
        cellViewModels = topics.map { .init(topicStyle: .type($0)) }
    }
    
}

// MARK: - Public methods

extension PickTopicViewModel {
    
    func moveToContentListScene(at indexTopic: Int) {
        didGoToContentList?(topics[indexTopic])
    }
    
}
      
