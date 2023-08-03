//
//  VehiclesDTO.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

struct VehicleDTO: Decodable {
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, vehicleClass: String
    let pilots, films: [String]
    let created, edited: String
    let url: String
    
    func toVehicle() -> Vehicle {
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
              vehicleClass: vehicleClass,
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
        case vehicleClass = "vehicle_class"
        case pilots, films, created, edited, url
    }
}

struct VehiclesResponse: Decodable {
    let count: Int
    let next: String?
    let results: [VehicleDTO]
}
