//
//  Film.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Film {
    let name: String
    let episodeID: Int
    let url, created, edited: String
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, species, vehicles: [String]
}

extension Film: ContentViewCellViewModelData {
    var subTitle: String { releaseDate }
    var shouldShowSubTitle: Bool { true }
}

extension Film: DetailsViewModelData {
    var details: String {
        """
        Date Created: \(releaseDate)
        Director: \(director)
        Producer(s): \(producer)
        Opening Crawl:
        \(openingCrawl)
        """
    }
    
    var speciesURL: [String]? { nil }
    var homeworldURL: String? { nil }
    
    var shouldShowSpecies: Bool { false }
    var shouldShowHomeWorld: Bool { false }
}
