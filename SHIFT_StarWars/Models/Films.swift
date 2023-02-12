//
//  Films.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation

struct Film: Codable {
    let name: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "title"
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

struct FilmsResponse: Codable {
    let count: Int
    let next: String?
    let results: [Film]
}

extension Film: ContentViewCellViewModelData {
    var subTitle: String { releaseDate }
    var shouldShowSubTitle: Bool { true }
}

extension Film: DetailsScreenViewModelData {
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
