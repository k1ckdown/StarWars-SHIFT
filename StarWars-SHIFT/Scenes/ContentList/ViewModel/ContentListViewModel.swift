//
//  ContentListViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 31.01.2023.
//

import Foundation

final class ContentListViewModel {
    
    // MARK: - Public properties
    
    var hideLoadingIndicator: (() -> Void)?
    var showLoadingIndicator: (() -> Void)?
    
    var updateCollectionData: (() -> Void)?
    var showReceivedError: ((String) -> Void)?
    var didGoToDetailsScene: ((DetailsViewModelData) -> Void)?
    
    private(set) var isLoading = false
    private(set) var cellViewModels = [ContentViewCellViewModel]()
    
    // MARK: - Private properties

    private var currentPage = 1
    private var isLastPage = false
    
    private let topic: TopicType
    
    private var detailsItems = [DetailsViewModelData]()
    private var contentItems = [ContentViewCellViewModelData]() {
        didSet {
            cellViewModels = contentItems.map {
                ContentViewCellViewModel(
                    name: $0.name.filter { $0 != "/" },
                    subTitle: $0.subTitle,
                    shouldShowSubTitle: $0.shouldShowSubTitle
                )
            }
            updateCollectionData?()
        }
    }
    
    // MARK: - Init
    
    init(topic: TopicType) {
        self.topic = topic
    }
    
}

// MARK: - Public methods

extension ContentListViewModel {
    
    func viewDidLoad() {
        getTopicContent()
    }
    
    func getNameTopic() -> String {
        topic.name.capitalized
    }
    
    func moveToDetails(at index: Int) {
        didGoToDetailsScene?(detailsItems[index])
    }
    
    func checkDownloadStatus() {
        (isLoading && currentPage != 1) ? showLoadingIndicator?() : hideLoadingIndicator?()
    }
    
    func startDownloadingData(_ index: Int) {
        if index == cellViewModels.count - 1 {
            getTopicContent()
        }
    }
    
}

// MARK: - Private methods

private extension ContentListViewModel {
    
    func checkIsLastPage(_ page: String?) {
        if page == nil {
            isLastPage = true
        }
    }
    
    func getTopicContent() {
        guard !isLastPage else { return }
        
        isLoading = true
        switch topic {
        case .characters:
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
    
    func getPeople() {
        APIService.shared.getTopic(endpoint: EndPointItems.people, page: currentPage) { (result: Result<PeopleResponse, Error>) in
            switch result {
            case .success(let people):
                self.isLoading = false
                self.contentItems.append(contentsOf: people.results)
                self.detailsItems.append(contentsOf: people.results)
                
                self.currentPage += 1
                self.checkIsLastPage(people.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getFilms() {
        APIService.shared.getTopic(endpoint: EndPointItems.films, page: currentPage) { (result: Result<FilmsResponse, Error>) in
            switch result {
            case .success(let films):
                self.isLoading = false
                self.contentItems.append(contentsOf: films.results)
                self.detailsItems.append(contentsOf: films.results)
                
                self.currentPage += 1
                self.checkIsLastPage(films.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getStarships() {
        APIService.shared.getTopic(endpoint: EndPointItems.starships, page: currentPage) { (result: Result<StarshipsResponse, Error>) in
            switch result {
            case .success(let starships):
                self.isLoading = false
                self.contentItems.append(contentsOf: starships.results)
                self.detailsItems.append(contentsOf: starships.results)
                
                self.currentPage += 1
                self.checkIsLastPage(starships.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getVehicles() {
        APIService.shared.getTopic(endpoint: EndPointItems.vehicles, page: currentPage) { (result: Result<VehiclesResponse, Error>) in
            switch result {
            case .success(let vehicles):
                self.isLoading = false
                self.contentItems.append(contentsOf: vehicles.results)
                self.detailsItems.append(contentsOf: vehicles.results)
                
                self.currentPage += 1
                self.checkIsLastPage(vehicles.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getPlanets() {
        APIService.shared.getTopic(endpoint: EndPointItems.planets, page: currentPage) { (result: Result<PlanetsResponse, Error>) in
            switch result {
            case .success(let planets):
                self.isLoading = false
                self.contentItems.append(contentsOf: planets.results)
                self.detailsItems.append(contentsOf: planets.results)
                
                self.currentPage += 1
                self.checkIsLastPage(planets.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getSpecies() {
        APIService.shared.getTopic(endpoint: EndPointItems.species, page: currentPage) { (result: Result<SpeciesResponse, Error>) in
            switch result {
            case .success(let species):
                self.isLoading = false
                self.contentItems.append(contentsOf: species.results)
                self.detailsItems.append(contentsOf: species.results)
                
                self.currentPage += 1
                self.checkIsLastPage(species.next)
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
}
