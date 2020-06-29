//
//  Router.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//


import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    case searchFilms(params: [String: Any])

    var searchFilmsUrl: String {
        return ""
    }
    
    var method: HTTPMethod {
        switch self {
        case .searchFilms:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .searchFilms:
            return searchFilmsUrl
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .searchFilms(let params):
            return params
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try ServiceConstants.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
