//
//  Starships.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Starship: Codable {
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, hyperdriveRating, mglt: String
    let starshipClass: String
    let pilots, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case pilots, films, created, edited, url
    }
}

struct StarshipsResponse: Codable {
    let count: Int
    let next: String?
    let results: [Starship]
}

extension Starship: ContentViewCellViewModelData {
    var subTitle: String { "" }
    var shouldShowSubTitle: Bool { false }
}

extension Starship: DetailsScreenViewModelData {
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
