//
//  Film.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation

struct Film : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let posterUrl : String
    
    enum CodingKeys : String,CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case posterUrl = "Poster"
    }
}
