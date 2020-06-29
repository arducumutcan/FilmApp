//
//  FilmDetailViewModelImpl.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import RxSwift
import XCoordinator

class FilmDetailPageViewModelImpl: FilmDetailPageViewModel, FilmDetailPageViewModelInput, FilmDetailPageViewModelOutput {
    
    
    
    private let router: UnownedRouter<HomeRoute>
    private let disposeBag = DisposeBag()
    private let detailPageUseCase: DetailFilmPageUseCases
    var filmDetail = PublishSubject<FilmDetailPage>()
    private let movieId: String
    
    init(router: UnownedRouter<HomeRoute>, detailPageUseCase: DetailFilmPageUseCases, movieId: String) {
        self.router = router
        self.detailPageUseCase = detailPageUseCase
        self.movieId = movieId
    }
    
    func getFilmDetail() {
        let params = [ServiceConstants.apiKeyParam: ServiceConstants.apiKey, "i": movieId]
        
        detailPageUseCase.detailFilmPage(params: params).subscribe(onNext: { [weak self] event in
            
            self?.filmDetail.onNext(event)
            
            FireBaseManager.logAnalytics(name: "lastDetailPage", parameters: event.title.dict)
            
        }).disposed(by: self.disposeBag)
    }
}
