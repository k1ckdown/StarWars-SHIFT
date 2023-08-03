//
//  СharacterDTO.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

struct СharacterDTO: Decodable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String
    
    func toСharacter() -> Сharacter {
        .init(name: name,
              height: height,
              mass: mass,
              hairColor: hairColor,
              url: url,
              homeworld: homeworld,
              created: created,
              edited: edited,
              gender: gender,
              skinColor: skinColor,
              eyeColor: skinColor,
              birthYear: birthYear,
              films: films,
              species: species,
              vehicles: vehicles,
              starships: starships)
    }

    private enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}


struct СharacterResponse: Decodable {
    let count: Int
    let next: String?
    let results: [СharacterDTO]
}
