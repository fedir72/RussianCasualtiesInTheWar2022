//
//  CustomError.swift
//  RussianCasualtiesInTheWar2022
//
//  Created by Fedii Ihor on 03.07.2022.
//

import Foundation

enum CustomError: Error, CustomNSError {
    case noFileInBundle
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    case invalidDataType
    
    var localizedDescription: String {
        switch self {
        case .noFileInBundle: return "There are not file in Bundle"
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        case .invalidDataType: return "Invalid data type"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}

