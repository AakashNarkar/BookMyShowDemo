//
//  ServiceAPI.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import Foundation

// MARK: - APIResult
typealias APIResponse = (Result<[StudentModel], Error>)

// MARK: - ServiceAPIProtocol
protocol ServiceAPIProtocol {
    func getMatchDetails(apiMethod: APIManager, completion: @escaping (APIResponse) -> ())
}

// MARK: - ServiceAPI
class ServiceAPI: ServiceAPIProtocol {
    let networkManager = NetworkManager.shared
    
    func getMatchDetails(apiMethod: APIManager, completion: @escaping (APIResponse) -> ()) {
        networkManager.apiCall(requstMethod: apiMethod) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                if let response = strongSelf.parseData(data: data, model: [StudentModel].self) {
                    completion(.success(response))
                } else {
                    completion(.failure(CustomError.notParseModel))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func parseData<T: Codable>(data: Data, model: T.Type) -> T? {
        do {
            let data = try JSONDecoder().decode(T.self, from: data)
            return data
        }
        
        catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}

