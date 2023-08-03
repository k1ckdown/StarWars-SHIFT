//
//  Starship.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Starship {
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, hyperdriveRating, mglt: String
    let starshipClass: String
    let pilots, films: [String]
    let url, created, edited: String
}

extension Starship: ContentViewCellViewModelData {
    var subTitle: String { "" }
    var shouldShowSubTitle: Bool { false }
}

extension Starship: DetailsViewModelData {
    var details: String {
        """
        Model: \(model)
        Manufacturer: \(manufacturer)
        Class: \(starshipClass)
        Cost: \(costInCredits) credits
        Speed: \(maxAtmospheringSpeed)km/h
        Hyperdrive Rating: \(hyperdriveRating)
        MGLT: \(mglt)
        Lenght: \(length)m
        Minimum Crew: \(crew)
        Passengers: \(passengers)
        """
    }
    
    var speciesURL: [String]? { nil }
    var homeworldURL: String? { nil }
    
    var shouldShowSpecies: Bool { false }
    var shouldShowHomeWorld: Bool { false }
}
