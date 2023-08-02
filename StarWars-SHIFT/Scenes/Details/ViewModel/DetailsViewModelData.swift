//
//  DetailsViewModelData.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

protocol DetailsViewModelData {
    var name: String { get }
    var details: String { get }
    
    var speciesURL: [String]? { get }
    var homeworldURL: String? { get }
    
    var shouldShowSpecies: Bool { get }
    var shouldShowHomeWorld: Bool { get }
}
