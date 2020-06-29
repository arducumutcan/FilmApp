//
//  FilmsUseCases.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchFilmsUseCaseType {
    
    func searchFilms(params: [String: Any]) -> Observable<SearchFilmsResponse>
}

struct SearchFilmsUseCases: SearchFilmsUseCaseType {
    
    func searchFilms(params: [String : Any]) -> Observable<SearchFilmsResponse> {
        let repository = Repository()
        return repository.searchFilms(params: params)
    }
}
