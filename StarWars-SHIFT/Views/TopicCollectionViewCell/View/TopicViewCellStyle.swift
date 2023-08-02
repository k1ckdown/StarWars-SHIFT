//
//  TopicViewCellStyle.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.08.2023.
//

import UIKit

enum TopicViewCellStyle {
    case type(TopicType)
    
    var title: String {
        switch self {
        case .type(let topicType):
            return topicType.name
        }
    }
    
    var titleColor: UIColor? {
        if case .type(let topicType) = self {
            switch topicType {
            case .characters:
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
        return .black
    }
    
}
