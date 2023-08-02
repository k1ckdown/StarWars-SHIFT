//
//  ContentViewCellViewModelData.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

protocol ContentViewCellViewModelData {
    var name: String { get }
    var subTitle: String { get }
    var shouldShowSubTitle: Bool { get }
}
