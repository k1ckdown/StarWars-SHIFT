//
//  RepositoryFactory.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

protocol GuideItemsRepositoryFactory {
    func makeGuideItemsRepository() -> GuideItemsRepositoryProtocol
}
