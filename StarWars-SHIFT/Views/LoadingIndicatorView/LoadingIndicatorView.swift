//
//  LoadingIndicatorView.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import UIKit

final class LoadingIndicatorView: UIActivityIndicatorView {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        style = .large
        color = .appYellow
        hidesWhenStopped = true
    }
    
}
