//
//  ContentListViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 31.01.2023.
//

import Foundation

final class ContentListViewModel {
    typealias Factory = GuideItemsRepositoryFactory
    
    // MARK: - Public properties
    
    var hideLoadingIndicator: (() -> Void)?
    var showLoadingIndicator: (() -> Void)?
    
    var updateCollectionData: (() -> Void)?
    var showReceivedError: ((String) -> Void)?
    var didGoToDetailsScene: ((DetailsViewModelData) -> Void)?
    
    var nameTopic: String {
        topic.name.capitalized
    }
    
    private(set) var isLoading = false
    private(set) var cellViewModels = [ContentViewCellViewModel]()
    
    // MARK: - Private properties

    private let factory: Factory
    
    private var currentPage = 1
    private var isLastPage = false
    
    private let topic: TopicType
    private lazy var guideItemsRepository = factory.makeGuideItemsRepository()
    
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
    
    init(factory: Factory, topic: TopicType) {
        self.topic = topic
        self.factory = factory
    }
    
}

// MARK: - Public methods

extension ContentListViewModel {
    
    func viewDidLoad() {
        getTopicContent()
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
    
    func didFetchPage(_ page: String?) {
        isLoading = false
        currentPage += 1
        
        if page == nil {
            isLastPage = true
        }
    }
    
    func getTopicContent() {
        guard !isLastPage else { return }
        
        isLoading = true
        switch topic {
        case .characters:
            fetchPeople()
        case .films:
            fetchFilms()
        case .starships:
            fetchStarships()
        case .vehicles:
            fetchVehicles()
        case .planets:
            fetchPlanets()
        case .species:
            fetchSpecies()
        }
    }
    
    func fetchPeople() {
        guideItemsRepository.getCharacters(currentPage) { result in
            switch result {
            case .success(let value):
                self.didFetchPage(value.next)
                self.contentItems.append(contentsOf: value.results.map { $0.toСharacter() })
                self.detailsItems.append(contentsOf: value.results.map { $0.toСharacter() })
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func fetchFilms() {
        guideItemsRepository.getFilms(currentPage) { result in
            switch result {
            case .success(let value):
                self.didFetchPage(value.next)
                self.contentItems.append(contentsOf: value.results.map { $0.toFilm() })
                self.detailsItems.append(contentsOf: value.results.map { $0.toFilm() })
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func fetchStarships() {
        guideItemsRepository.getStarships(currentPage) { result in
            switch result {
            case .success(let value):
                self.didFetchPage(value.next)
                self.contentItems.append(contentsOf: value.results.map { $0.toStarship() })
                self.detailsItems.append(contentsOf: value.results.map { $0.toStarship() })
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func fetchVehicles() {
        guideItemsRepository.getVehicles(currentPage) { result in
            switch result {
            case .success(let value):
                self.didFetchPage(value.next)
                self.contentItems.append(contentsOf: value.results.map { $0.toVehicle() })
                self.detailsItems.append(contentsOf: value.results.map { $0.toVehicle() })
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func fetchPlanets() {
        guideItemsRepository.getPlanets(currentPage) { result in
            switch result {
            case .success(let value):
                self.didFetchPage(value.next)
                self.contentItems.append(contentsOf: value.results.map { $0.toPlanet() })
                self.detailsItems.append(contentsOf: value.results.map { $0.toPlanet() })
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func fetchSpecies() {
        guideItemsRepository.getSpecies(currentPage) { result in
            switch result {
            case .success(let value):
                self.didFetchPage(value.next)
                self.contentItems.append(contentsOf: value.results.map { $0.toSpecies() })
                self.detailsItems.append(contentsOf: value.results.map { $0.toSpecies() })
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
}
