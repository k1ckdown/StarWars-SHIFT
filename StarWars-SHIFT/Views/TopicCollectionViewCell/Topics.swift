//
//  Topics.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation
import UIKit

enum Topics: CaseIterable {
    case people, films, starships, vehicles, planets, species
    
    var nameTopic: String {
        switch self {
        case .people:
            return "characters"
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
    
    var colorForTitle: UIColor {
        switch self {
        case .people:
            return .titlePeople
        case .films:
            return .titleFilms
        case .starships:
            return .titleStarships
        case .vehicles:
            return .titleVehicles
        case .planets:
            return .titlePlanets
        case .species:
            return .titleSpecies
        }
    }
}
