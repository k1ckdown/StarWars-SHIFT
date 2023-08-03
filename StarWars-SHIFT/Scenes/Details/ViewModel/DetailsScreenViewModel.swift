//
//  DetailsViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.02.2023.
//

import Foundation

final class DetailsViewModel {
    typealias Factory = GuideItemsRepositoryFactory
    
    // MARK: - Public properties
    
    var showContent: (() -> Void)?
    
    var showHomeworlnfo: (() -> Void)?
    var showSpecieslnfo: (() -> Void)?
    
    var showLoadingIndicator: (() -> Void)?
    var showReceivedError: ((String) -> Void)?
    
    var applyModalWindowAppearance: (() -> Void)?
    var updateDetailsData: ((String, String) -> Void)?
    var didPresentOptionDetails: ((DetailsViewModelData) -> Void)?
    
    var detailText: String {
        detailsData.details
    }
    
    var nameItem: String {
        detailsData.name.filter { $0 != "/" }
    }
    
    var speciesTitle: String {
        "Species: "
    }
    
    var homeworldTitle: String {
        "Homeworld: "
    }
    
    var isContainsOptionalInfo: Bool {
        detailsData.shouldShowSpecies || detailsData.shouldShowHomeWorld
    }
    
    // MARK: - Private properties
    
    private let factory: Factory
    
    private let isOptional: Bool
    private let detailsData: DetailsViewModelData
    private var speciesItem: DetailsViewModelData?
    private var homeworldItem: DetailsViewModelData? {
        didSet {
            updateDetailsData?(speciesItem?.name ?? "unknown",
                               homeworldItem?.name ?? "unknown")
        }
    }
    
    private lazy var guideItemsRepository = factory.makeGuideItemsRepository()
    
    // MARK: - Init
    
    init(factory: Factory, detailsData: DetailsViewModelData, isOptional: Bool) {
        self.factory = factory
        self.isOptional = isOptional
        self.detailsData = detailsData
    }
    
}
    
// MARK: - Public methods

extension DetailsViewModel {
    
    func isUnknown(_ name: String?) -> Bool {
        guard let name = name else { return false }
        return name == "unknown"
    }
    
    func showSpeciesDetails() {
        guard let speciesItem = speciesItem else { return }
        didPresentOptionDetails?(speciesItem)
    }
    
    func showHomeworldDetails() {
        guard let homeworldItem = homeworldItem else { return }
        didPresentOptionDetails?(homeworldItem)
    }
    
    func viewDidLoad() {
        if isOptional {
            applyModalWindowAppearance?()
        }
        
        guard detailsData.shouldShowSpecies || detailsData.shouldShowHomeWorld else {
            showContent?()
            return
        }
        
        showLoadingIndicator?()
        if detailsData.shouldShowSpecies {
            getSpecies()
            showSpecieslnfo?()
        }
        
        if detailsData.shouldShowHomeWorld {
            getHomeworld()
            showHomeworlnfo?()
        }
    }
    
}

// MARK: - Private methods

private extension DetailsViewModel {
    
    func getSpecies() {
        guard let speciesURL = detailsData.speciesURL?.first else { return }
        
        guideItemsRepository.getSpeciesDetails(speciesURL) { result in
            switch result {
            case .success(let value):
                self.speciesItem = value.toSpecies()
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getHomeworld() {
        guard let homeworldURL = detailsData.homeworldURL else { return }
        
        guideItemsRepository.getHomeworldDetails(homeworldURL) { result in
            switch result {
            case .success(let value):
                self.homeworldItem = value.toPlanet()
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
}
