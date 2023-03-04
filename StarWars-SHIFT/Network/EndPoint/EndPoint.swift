//
//  EndPoint.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

protocol EndPointType {
    var baseURL: String { get }
    var pathURL: String { get }
    var url: String { get }
}

enum EndPointItems {
    case people, films, starships, vehicles, planets, species
}

extension EndPointItems: EndPointType {
    var baseURL: String {
        return "https://swapi.dev/api"
    }
    
    var pathURL: String {
        switch self {
        case .people:
            return "people"
        case .films:
            return "films"
        case .starships:
            return "starships"
        case .vehicles:
            return "vehicles"
        case .planets:
            return "planets"
        case .species:
            return "species"
        }
    }
    
    var url: String {
        return "\(baseURL)/\(pathURL)"
    }
}
