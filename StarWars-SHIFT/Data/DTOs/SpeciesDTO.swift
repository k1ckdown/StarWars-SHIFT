//
//  SpeciesDTO.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

struct SpeciesDTO: Decodable {
    let name, classification: String
    let designation: String
    let averageHeight, skinColors, hairColors, eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people, films: [String]
    let created, edited: String
    let url: String
    
    func toSpecies() -> Species {
        .init(name: name,
              classification: classification,
              designation: designation,
              averageHeight: averageHeight,
              skinColors: skinColors,
              hairColors: hairColors,
              eyeColors: eyeColors,
              averageLifespan: averageLifespan,
              homeworld: homeworld,
              language: language,
              people: people,
              films: films,
              url: url,
              created: created,
              edited: edited)
    }

    private enum CodingKeys: String, CodingKey {
        case name, classification, designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld, language, people, films, created, edited, url
    }
}

struct SpeciesResponse: Decodable {
    let count: Int
    let next: String?
    let results: [SpeciesDTO]
}
