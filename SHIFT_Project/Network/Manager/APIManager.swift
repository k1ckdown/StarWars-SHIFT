//
//  APIManager.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation
import Alamofire

final class APIManager {
    
    static let shared = APIManager()
    
    private init() {}
    
    func loadData<T: Decodable>(urlString: String, query: TopicContentQuery? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(urlString, parameters: query)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
