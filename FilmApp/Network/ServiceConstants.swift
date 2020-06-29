//
//  ServiceConstants.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation

struct ServiceConstants {
    public static let baseUrl = "https://www.omdbapi.com"
    public static let apiKeyParam = "apikey"
    public static let apiKey = "1257d3fe"
}

enum ContentType: String {
    case json = "application/json"
    case urlEncoded = "application/x-www-form-urlencoded"
}

enum HTTPHeaderField: String {
    case authentication  = "Authorization"
    case contentType     = "Content-Type"
    case acceptType      = "Accept"
    case acceptEncoding  = "Accept-Encoding"
    case acceptLangauge  = "Accept-Language"
    case userAgent       = "User-Agent"
}
