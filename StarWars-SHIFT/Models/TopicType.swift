//
//  Topics.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation
import UIKit

enum TopicType: String, CaseIterable {
    case characters
    case films
    case starships
    case vehicles
    case planets
    case species
    
    var name: String {
        self.rawValue
    }
}
