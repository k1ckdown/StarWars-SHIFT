//
//  GuideItemsRepository.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

final class GuideItemsRepository {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
}

extension GuideItemsRepository: GuideItemsRepositoryProtocol {
    
    func getFilms(_ page: Int, completion: @escaping (Result<FilmsResponse, Error>) -> Void) {
        apiService.getTopic(endpoint: .films, page: page, completionHandler: completion)
    }
    
    func getSpecies(_ page: Int, completion: @escaping (Result<SpeciesResponse, Error>) -> Void) {
        apiService.getTopic(endpoint: .species, page: page, completionHandler: completion)
    }
    
    func getPlanets(_ page: Int, completion: @escaping (Result<PlanetsResponse, Error>) -> Void) {
        apiService.getTopic(endpoint: .planets, page: page, completionHandler: completion)
    }
    
    func getVehicles(_ page: Int, completion: @escaping (Result<VehiclesResponse, Error>) -> Void) {
        apiService.getTopic(endpoint: .vehicles, page: page, completionHandler: completion)
    }
    
    func getStarships(_ page: Int, completion: @escaping (Result<StarshipsResponse, Error>) -> Void) {
        apiService.getTopic(endpoint: .starships, page: page, completionHandler: completion)
    }
    
    func getCharacters(_ page: Int, completion: @escaping (Result<СharacterResponse, Error>) -> Void) {
        apiService.getTopic(endpoint: .people, page: page, completionHandler: completion)
    }
    
    func getSpeciesDetails(_ urlString: String, completion: @escaping ((Result<SpeciesDTO, Error>) -> Void)) {
        apiService.getContentDetails(urlString: urlString, completionHandler: completion)
    }
    
    func getHomeworldDetails(_ urlString: String, completion: @escaping ((Result<PlanetDTO, Error>) -> Void)) {
        apiService.getContentDetails(urlString: urlString, completionHandler: completion)
    }
    
}
