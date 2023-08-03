//
//  GuideItemsRepositoryProtocol.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

protocol GuideItemsRepositoryProtocol {
    func getFilms(_ page: Int, completion: @escaping (Result<FilmsResponse, Error>) -> Void)
    func getSpecies(_ page: Int, completion: @escaping (Result<SpeciesResponse, Error>) -> Void)
    func getPlanets(_ page: Int, completion: @escaping (Result<PlanetsResponse, Error>) -> Void)
    func getVehicles(_ page: Int, completion: @escaping (Result<VehiclesResponse, Error>) -> Void)
    func getStarships(_ page: Int, completion: @escaping (Result<StarshipsResponse, Error>) -> Void)
    func getCharacters(_ page: Int, completion: @escaping (Result<СharacterResponse, Error>) -> Void)
    func getSpeciesDetails(_ urlString: String, completion: @escaping ((Result<SpeciesDTO, Error>) -> Void))
    func getHomeworldDetails(_ urlString: String, completion: @escaping ((Result<PlanetDTO, Error>) -> Void))
}
