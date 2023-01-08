//
//  APIManager.swift
//  BookMyShowDemo
//
//  Created by Neosoft on 08/01/23.
//

import Foundation

// MARK: - APIManager
enum APIManager {
    case getStudentData
    
    var apiMethod : String {
        switch self {
        case .getStudentData:
            return ApiMethodType.get.rawValue
        }
    }
    
    var getUrl: URL {
        var url = ""
        switch self {
        case .getStudentData:
            url = Constants.studentDataEndURL
        }
        return URL(string: Constants.baseURL + url)!
    }
}

