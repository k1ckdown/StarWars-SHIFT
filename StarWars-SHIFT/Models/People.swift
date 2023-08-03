//
//  People.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Сharacter {
    let name, height, mass, hairColor: String
    let url, homeworld, created, edited: String
    let gender, skinColor, eyeColor, birthYear: String
    let films, species, vehicles, starships: [String]
}

extension Сharacter: ContentViewCellViewModelData {
    var subTitle: String { birthYear }
    var shouldShowSubTitle: Bool { true }
}

extension Сharacter: DetailsViewModelData {
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
