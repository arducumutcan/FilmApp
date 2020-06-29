//
//  Repository.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import RxSwift

class Repository {
    func searchFilms(params: [String: Any]) -> Observable<SearchFilmsResponse> {
        return ApiClient.searchFilms(params: params)
    }
    
    func detailFilmPage(params: [String: Any]) -> Observable<FilmDetailPage> {
        return ApiClient.detailFilmPage(params: params)
    }
}
