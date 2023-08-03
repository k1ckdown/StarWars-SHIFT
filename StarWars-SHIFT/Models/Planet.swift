//
//  Planet.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Planet {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let url, created, edited: String
}

extension Planet: ContentViewCellViewModelData {
    var subTitle: String { "" }
    var shouldShowSubTitle: Bool { false }
}

extension Planet: DetailsViewModelData {
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
