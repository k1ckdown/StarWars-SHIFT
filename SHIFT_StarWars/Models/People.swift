//
//  People.swift
//  SHIFT_StarWars
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct People: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: Gender
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
    case hermaphrodite = "hermaphrodite"
    case none = "none"
    case nA = "n/a"
}

struct PeopleResponse: Codable {
    let count: Int
    let next: String?
    let results: [People]
}

extension People: ContentViewCellViewModelData {
    var subTitle: String { birthYear }
    var shouldShowSubTitle: Bool { true }
}

extension People: DetailsScreenViewModelData {
    var details: String {
        """
        Birth Year: \(birthYear)
        Height: \(height)cm
        Mass: \(mass)kg
        Gender: \(gender)
        Hair Color: \(hairColor)
        Skin Color: \(skinColor)
        """
    }
    
    var speciesURL: [String]? { species }
    var homeworldURL: String? { homeworld }
    
    var shouldShowSpecies: Bool { true }
    var shouldShowHomeWorld: Bool { true }
}
