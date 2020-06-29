//
//  FilmPageDetail.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit

struct FilmDetailPage : Codable {
    
    let title : String
    let posterUrl : String
    
    enum CodingKeys : String,CodingKey {
        case title = "Title"
        case posterUrl = "Poster"
    }
}
