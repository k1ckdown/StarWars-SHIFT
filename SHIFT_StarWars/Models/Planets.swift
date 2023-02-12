//
//  Planets.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Planet: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}

struct PlanetsResponse: Codable {
    let count: Int
    let next: String?
    let results: [Planet]
}

extension Planet: ContentViewCellViewModelData {
    var subTitle: String { "" }
    var shouldShowSubTitle: Bool { false }
}

extension Planet: DetailsScreenViewModelData {
    var details: String {
        """
        Population: \(population)
        Rotation Period: \(rotationPeriod) days
        Orbital Period: \(orbitalPeriod) days
        Diameter: \(diameter)km
        Gravity: \(gravity)
        Terrain: \(terrain)
        Surface Water: \(surfaceWater)%
        Climate: \(climate)
        """
    }
    
    var speciesURL: [String]? { nil }
    var homeworldURL: String? { nil }
    
    var shouldShowSpecies: Bool { false }
    var shouldShowHomeWorld: Bool { false }
}
