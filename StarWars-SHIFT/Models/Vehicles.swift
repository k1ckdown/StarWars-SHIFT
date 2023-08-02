//
//  Vehicles.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Vehicle: Codable {
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, vehicleClass: String
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
        case vehicleClass = "vehicle_class"
        case pilots, films, created, edited, url
    }
}

struct VehiclesResponse: Codable {
    let count: Int
    let next: String?
    let results: [Vehicle]
}

extension Vehicle: ContentViewCellViewModelData {
    var subTitle: String { "" }
    var shouldShowSubTitle: Bool { false }
}

extension Vehicle: DetailsViewModelData {
    var details: String {
        """
        Model: \(model)
        Manufacturer: \(manufacturer)
        Class: \(vehicleClass)
        Cost: \(costInCredits) credits
        Speed: \(maxAtmospheringSpeed)km/h
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
