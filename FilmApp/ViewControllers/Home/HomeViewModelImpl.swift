//
//  HomeViewModelImpl.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import RxSwift
import Action
import XCoordinator

class HomeViewModelImpl: HomeViewModel, HomeViewModelInput, HomeViewModelOutput {
    
    private let router: UnownedRouter<HomeRoute>
    private let searchFilmUseCase: SearchFilmsUseCases
    private let disposeBag = DisposeBag()
    
    var filmList = PublishSubject<[Film]>()

    init(router: UnownedRouter<HomeRoute>, searchUseCase: SearchFilmsUseCases) {
        self.router = router
        self.searchFilmUseCase = searchUseCase
    }
    
    func searchFilms(apiKey: String, searchText: String) {
        let params = ["apikey": apiKey, "s": searchText]
        searchFilmUseCase.searchFilms(params: params).subscribe(onNext: { event in
            self.filmList.onNext(event.films ?? [Film]())
        }).disposed(by: self.disposeBag)
    }
    
    func navigateToFilmDetailPage(filmId: String) {
        self.router.trigger(.detailPage(id: filmId))
    }
}
