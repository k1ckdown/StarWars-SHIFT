//
//  Species.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Species {
    let name, classification: String
    let designation: String
    let averageHeight, skinColors, hairColors, eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people, films: [String]
    let url, created, edited: String
}

extension Species: ContentViewCellViewModelData {
    var subTitle: String { "" }
    var shouldShowSubTitle: Bool { false }
}

extension Species: DetailsViewModelData {
    var details: String {
        """
        Classification: \(classification)
        Designation: \(designation)
        Language: \(language)
        Avg Lifespan: \(averageLifespan) years
        Avg Height: \(averageHeight)cm
        Hair Color(s): \(hairColors)
        Skin Color(s): \(skinColors)
        Eye Color(s): \(eyeColors)
        """
    }
    
    var speciesURL: [String]? { nil }
    var homeworldURL: String? { nil }
    
    var shouldShowSpecies: Bool { false }
    var shouldShowHomeWorld: Bool { false }
}
