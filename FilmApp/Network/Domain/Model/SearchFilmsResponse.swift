//
//  SearchFilmsResponse.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation

struct SearchFilmsResponse : Codable{
    let isSuccess : String
    let isError : String?
    let films : [Film]?
    
    enum CodingKeys : String,CodingKey{
        case isSuccess = "Response"
        case isError = "Error"
        case films = "Search"
    }
}
