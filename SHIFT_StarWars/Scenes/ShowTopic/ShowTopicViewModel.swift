//
//  ShowTopicViewModel.swift
//  SHIFT_StarWars
//
//  Created by Ivan Semenov on 31.01.2023.
//

import Foundation
import UIKit

final class ShowTopicViewModel {
    
    // MARK: - Public properties
    
    var updateCollectionData: (() -> Void)?
    var goToDescriptionScreen: ((UIViewController) -> Void)?
    var startLoadingIndicator: (() -> Void)?
    var stopLoadingIndicator: (() -> Void)?
    var showReceivedError: ((String) -> Void)?
    
    var cellViewModels: [ContentViewCellViewModel] = []
    
    // MARK: - Private properties
    
    private var content: [ContentViewCellViewModelData] = [] {
        didSet {
            self.cellViewModels = self.content.map { ContentViewCellViewModel.init(name: $0.name.filter { $0 != "/" }, subTitle: $0.subTitle, shouldShowSubTitle: $0.shouldShowSubTitle) }
            self.updateCollectionData?()
        }
    }
    private var detailsItems: [DetailsScreenViewModelData] = []
    
    private let topic: Topics
    private var nameTopic: String
    private(set) var isLoading = false
    private var currentPage = 1
    private var isLastPage = false
    
    // MARK: - Inits
    
    init(topic: Topics) {
        self.topic = topic
        nameTopic = topic.nameTopic
        getTopicContent()
        isLoading = false
    }
    
    // MARK: - Public methods
    
    func goToDetailScreen(for index: Int) {
        let viewModel = DetailsScreenViewModel(topicItem: detailsItems[index])
        let viewController = DetailsScreenViewController(viewModel: viewModel)
        goToDescriptionScreen?(viewController)
    }
    
    func startDownloadingData(_ index: Int) {
        if index == cellViewModels.count - 1 {
            getTopicContent()
        }
    }
    
    func checkDownloadStatus() {
        guard isLoading else {
            stopLoadingIndicator?()
            return
        }
        startLoadingIndicator?()
    }
    
    func getNameTopic() -> String {
        return nameTopic[nameTopic.startIndex].uppercased() + nameTopic[nameTopic.index(after: nameTopic.startIndex)..<nameTopic.endIndex]
    }
    
    // MARK: - Private methods
    
    private func checkIsLastPage(_ page: String?) {
        if page == nil {
            isLastPage = true
        }
    }
    
    private func getTopicContent() {
        guard !isLastPage else { return }
        
        isLoading = true
        switch topic {
        case .people:
            getPeople()
        case .films:
            getFilms()
        case .starships:
            getStarships()
        case .vehicles:
            getVehicles()
        case .planets:
            getPlanets()
        case .species:
            getSpecies()
        }
    }
    
     private func getPeople() {
         APIServices.shared.getTopic(endpoint: EndPointItems.people, page: currentPage) { (result: Result<PeopleResponse, Error>) in
            switch result {
            case .success(let people):
                self.isLoading = false
                self.content.append(contentsOf: people.results)
                self.detailsItems.append(contentsOf: people.results)
                
                self.currentPage += 1
                self.checkIsLastPage(people.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    private func getFilms() {
        APIServices.shared.getTopic(endpoint: EndPointItems.films, page: currentPage) { (result: Result<FilmsResponse, Error>) in
            switch result {
            case .success(let films):
                self.isLoading = false
                self.content.append(contentsOf: films.results)
                self.detailsItems.append(contentsOf: films.results)
                
                self.currentPage += 1
                self.checkIsLastPage(films.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    private func getStarships() {
        APIServices.shared.getTopic(endpoint: EndPointItems.starships, page: currentPage) { (result: Result<StarshipsResponse, Error>) in
            switch result {
            case .success(let starships):
                self.isLoading = false
                self.content.append(contentsOf: starships.results)
                self.detailsItems.append(contentsOf: starships.results)
                
                self.currentPage += 1
                self.checkIsLastPage(starships.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    private func getVehicles() {
        APIServices.shared.getTopic(endpoint: EndPointItems.vehicles, page: currentPage) { (result: Result<VehiclesResponse, Error>) in
            switch result {
            case .success(let vehicles):
                self.isLoading = false
                self.content.append(contentsOf: vehicles.results)
                self.detailsItems.append(contentsOf: vehicles.results)
                
                self.currentPage += 1
                self.checkIsLastPage(vehicles.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    private func getPlanets() {
        APIServices.shared.getTopic(endpoint: EndPointItems.planets, page: currentPage) { (result: Result<PlanetsResponse, Error>) in
            switch result {
            case .success(let planets):
                self.isLoading = false
                self.content.append(contentsOf: planets.results)
                self.detailsItems.append(contentsOf: planets.results)
                
                self.currentPage += 1
                self.checkIsLastPage(planets.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    private func getSpecies() {
        APIServices.shared.getTopic(endpoint: EndPointItems.species, page: currentPage) { (result: Result<SpeciesResponse, Error>) in
            switch result {
            case .success(let species):
                self.isLoading = false
                self.content.append(contentsOf: species.results)
                self.detailsItems.append(contentsOf: species.results)
                
                self.currentPage += 1
                self.checkIsLastPage(species.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
}
