//
//  Species.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Species: Codable {
    let name, classification: String
    let designation: Designation
    let averageHeight, skinColors, hairColors, eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, classification, designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld, language, people, films, created, edited, url
    }
}

enum Designation: String, Codable {
    case reptilian = "reptilian"
    case sentient = "sentient"
}

struct SpeciesResponse: Codable {
    let count: Int
    let next: String?
    let results: [Species]
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
