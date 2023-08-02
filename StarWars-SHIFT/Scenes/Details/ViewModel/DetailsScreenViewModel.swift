//
//  DetailsViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.02.2023.
//

import Foundation

final class DetailsViewModel {
    
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
    
    private let isOptional: Bool
    private let detailsData: DetailsViewModelData
    private var speciesItem: DetailsViewModelData?
    private var homeworldItem: DetailsViewModelData? {
        didSet {
            updateDetailsData?(speciesName, homeworldName)
        }
    }
    
    private var speciesName = "unknown"
    private var homeworldName = "unknown"
    
    // MARK: - Init
    
    init(detailsData: DetailsViewModelData, isOptional: Bool) {
        self.detailsData = detailsData
        self.isOptional = isOptional
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
        
        APIService.shared.getContentDetails(urlString: speciesURL) { (result: Result<Species, Error>) in
            switch result {
            case .success(let species):
                self.speciesName = species.name
                self.speciesItem = species
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    func getHomeworld() {
        guard let homeworldURL = detailsData.homeworldURL else { return }
        
        APIService.shared.getContentDetails(urlString: homeworldURL) { (result: Result<Planet, Error>) in
            switch result {
            case .success(let planet):
                self.homeworldName = planet.name
                self.homeworldItem = planet
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
}
