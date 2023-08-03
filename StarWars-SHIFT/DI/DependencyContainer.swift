//
//  DependencyContainer.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import Foundation

final class DependencyContainer {
    private lazy var apiService = APIService()
    private lazy var guideItemsRepository = GuideItemsRepository(apiService: makeApiService())
}

// MARK: - APIServiceFactory

extension DependencyContainer: APIServiceFactory {
    func makeApiService() -> APIService {
        return apiService
    }
}

// MARK: - GuideItemsRepositoryFactory

extension DependencyContainer: GuideItemsRepositoryFactory {
    func makeGuideItemsRepository() -> GuideItemsRepositoryProtocol {
        return guideItemsRepository
    }
}
