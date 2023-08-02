//
//  UIColor+AppColors.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 29.01.2023.
//

import UIKit

extension UIColor {
    static let appGray =  UIColor(named: "appGray")
    static let appBlack = UIColor(named: "appBlack")
    static let appWhite = UIColor(named: "appWhite")
    static let appYellow = UIColor(named: "appYellow")
    
    static let titleFilms = UIColor(named: "titleFilms")
    static let titlePeople = UIColor(named: "titlePeople")
    static let titleSpecies = UIColor(named: "titleSpecies")
    static let titlePlanets = UIColor(named: "titlePlanets")
    static let titleVehicles = UIColor(named: "titleVehicles")
    static let titleStarships = UIColor(named: "titleStarships")
    
    static let spaceBackground = UIColor(patternImage: UIImage(named: "space") ?? .init())
}
