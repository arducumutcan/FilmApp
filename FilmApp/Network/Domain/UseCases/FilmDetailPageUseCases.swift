//
//  FilmDetailPageUseCases.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailFilmPageUseCaseType {
    
    func detailFilmPage(params: [String: Any]) -> Observable<FilmDetailPage>
}

struct DetailFilmPageUseCases: DetailFilmPageUseCaseType {
    
    func detailFilmPage(params: [String : Any]) -> Observable<FilmDetailPage> {
        let repository = Repository()
        return repository.detailFilmPage(params: params)
    }
}
