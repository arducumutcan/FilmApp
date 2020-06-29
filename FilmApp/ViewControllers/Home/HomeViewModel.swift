//
//  HomeViewModel.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import Action
import RxSwift
import XCoordinator

protocol HomeViewModelInput {
    
}

protocol HomeViewModelOutput {
    var filmList: PublishSubject<[Film]> { get }
}

protocol HomeViewModel {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
    
    func searchFilms(apiKey: String, searchText: String)
    func navigateToFilmDetailPage(filmId: String)
}

extension HomeViewModel where Self: HomeViewModelInput & HomeViewModelOutput {
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
}
