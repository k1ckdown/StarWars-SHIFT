//
//  ReuseIdentifier.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import Foundation

protocol ReuseIdentifier {
    
}

extension ReuseIdentifier {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

