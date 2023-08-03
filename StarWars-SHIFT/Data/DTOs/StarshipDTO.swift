//
//  StarshipDTO.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

struct StarshipDTO: Decodable {
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, hyperdriveRating, mglt: String
    let starshipClass: String
    let pilots, films: [String]
    let created, edited: String
    let url: String
    
    func toStarship() -> Starship {
        .init(name: name,
              model: model,
              manufacturer: manufacturer,
              costInCredits: costInCredits,
              length: length,
              maxAtmospheringSpeed: maxAtmospheringSpeed,
              crew: crew,
              passengers: passengers,
              cargoCapacity: cargoCapacity,
              consumables: consumables,
              hyperdriveRating: hyperdriveRating,
              mglt: mglt,
              starshipClass: starshipClass,
              pilots: pilots,
              films: films,
              url: url,
              created: created,
              edited: edited)
    }

    private enum CodingKeys: String, CodingKey {
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

struct StarshipsResponse: Decodable {
    let count: Int
    let next: String?
    let results: [StarshipDTO]
}
