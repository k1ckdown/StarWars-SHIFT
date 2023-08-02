//
//  StartViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 30.01.2023.
//

import Foundation

final class StartViewModel {
    
    // MARK: - Public properties
    
    var didGoToPickTopicScene: (() -> Void)?
    private(set) var mainTitle = "Explore the Star Wars \n universe"
    
}

// MARK: - Public methods

extension StartViewModel {
    
    func moveToPickTopicScene() {
        didGoToPickTopicScene?()
    }
    
}
