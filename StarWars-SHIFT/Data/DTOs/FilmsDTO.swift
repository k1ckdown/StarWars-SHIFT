//
//  FilmsDTO.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

struct FilmDTO: Decodable {
    let name: String
    let episodeID: Int
    let openingCrawl, director, producer, releaseDate: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String
    
    func toFilm() -> Film {
        .init(name: name,
              episodeID: episodeID,
              url: url,
              created: created,
              edited: edited,
              openingCrawl: openingCrawl,
              director: director,
              producer: producer,
              releaseDate: releaseDate,
              characters: characters,
              planets: planets,
              starships: starships,
              species: species,
              vehicles: vehicles)
    }

    private enum CodingKeys: String, CodingKey {
        case name = "title"
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}

struct FilmsResponse: Decodable {
    let count: Int
    let next: String?
    let results: [FilmDTO]
}
