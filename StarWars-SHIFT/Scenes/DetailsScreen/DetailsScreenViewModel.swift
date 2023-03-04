//
//  DetailsScreenViewModel.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.02.2023.
//

import Foundation
import UIKit

protocol DetailsScreenViewModelData {
    var name: String { get }
    var details: String { get }
    
    var speciesURL: [String]? { get }
    var homeworldURL: String? { get }
    
    var shouldShowSpecies: Bool { get }
    var shouldShowHomeWorld: Bool { get }
}

final class DetailsScreenViewModel {
    
    // MARK: - Public properties
    
    var showModalWithDetails: ((UINavigationController) -> Void)?
    var updateDetailsData: ((String, String) -> Void)?
    var showReceivedError: ((String) -> Void)?
    
    // MARK: - Private properties
    
    private let topicItem: DetailsScreenViewModelData
    private var speciesItem: DetailsScreenViewModelData?
    private var homeworldItem: DetailsScreenViewModelData? {
        didSet {
            updateDetailsData?(speciesName, homeworldName)
        }
    }
    
    private var speciesName = "unknown"
    private var homeworldName = "unknown"
    
    // MARK: - Inits
    
    init(topicItem: DetailsScreenViewModelData) {
        self.topicItem = topicItem
        getSpecies()
        getHomeworld()
    }
    
    // MARK: - Public methods
    
    func getNameItem() -> String {
        return topicItem.name.filter { $0 != "/" }
    }
    
    func getDetailText() -> String {
        return topicItem.details
    }
    
    func isUnknown(_ name: String?) -> Bool {
        guard let name = name else { return false }
        return name == "unknown"
    }
    
    func isSpecies() -> Bool {
        return topicItem.shouldShowSpecies
    }
    
    func isHomeWorld() -> Bool {
        return topicItem.shouldShowHomeWorld
    }
    
    func showSpeciesDetails() {
        guard let speciesItem = speciesItem else { return }
        
        let viewModel = DetailsScreenViewModel(topicItem: speciesItem)
        showModalWindow(with: viewModel)
    }
    
    func showHomeworldDetails() {
        guard let homeworldItem = homeworldItem else { return }
        
        let viewModel = DetailsScreenViewModel(topicItem: homeworldItem)
        showModalWindow(with: viewModel)
    }
    
    // MARK: - Private methods
    
    private func showModalWindow(with viewModel: DetailsScreenViewModel) {
        let viewController = DetailsScreenViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: viewController)
        navController.modalPresentationStyle = .formSheet
        self.showModalWithDetails?(navController)
    }
    
    private func getSpecies() {
        guard let speciesURL = topicItem.speciesURL else { return }
        guard !speciesURL.isEmpty else { return }
        
        APIServices.shared.getContentDetails(urlString: speciesURL[0]) { (result: Result<Species, Error>) in
            switch result {
            case .success(let species):
                self.speciesName = species.name
                self.speciesItem = species
            case .failure(let error):
                self.showReceivedError?(error.localizedDescription)
            }
        }
    }
    
    private func getHomeworld() {
        guard let homeworldURL = topicItem.homeworldURL else { return }
        
        APIServices.shared.getContentDetails(urlString: homeworldURL) { (result: Result<Planet, Error>) in
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
