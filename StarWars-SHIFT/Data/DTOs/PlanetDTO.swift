//
//  PlanetDTO.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

struct PlanetDTO: Decodable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String
    
    func toPlanet() -> Planet {
        .init(name: name,
              rotationPeriod: rotationPeriod,
              orbitalPeriod: orbitalPeriod,
              diameter: diameter,
              climate: climate,
              gravity: gravity,
              terrain: terrain,
              surfaceWater: surfaceWater,
              population: population,
              residents: residents,
              films: films,
              url: url,
              created: created,
              edited: edited)
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

struct PlanetsResponse: Decodable {
    let count: Int
    let next: String?
    let results: [PlanetDTO]
}
