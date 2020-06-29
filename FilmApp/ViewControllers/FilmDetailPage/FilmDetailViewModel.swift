//
//  FilmDetailViewModel.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import Action
import RxSwift
import XCoordinator

protocol FilmDetailPageViewModelInput {
    
}

protocol FilmDetailPageViewModelOutput {
    var filmDetail: PublishSubject<FilmDetailPage> { get }
}

protocol FilmDetailPageViewModel {
    var input: FilmDetailPageViewModelInput { get }
    var output: FilmDetailPageViewModelOutput { get }
    
    func getFilmDetail()
}

extension FilmDetailPageViewModel where Self: FilmDetailPageViewModelInput & FilmDetailPageViewModelOutput {
    var input: FilmDetailPageViewModelInput { return self }
    var output: FilmDetailPageViewModelOutput { return self }
}
