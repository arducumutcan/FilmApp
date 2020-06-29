//
//  HomeCoordinator.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import RxSwift
import XCoordinator


enum HomeRoute: Route {
    case home
    case detailPage(id: String)
}

class HomeCoordinator: NavigationCoordinator<HomeRoute> {
    
    init() {
        super.init(initialRoute: .home)
    }
    
    override func prepareTransition(for route: HomeRoute) -> NavigationTransition {
        
        switch route {
        case .home:
            let viewController = HomeViewController()
            let searchUseCase = SearchFilmsUseCases()
            let viewModel = HomeViewModelImpl(router: unownedRouter, searchUseCase: searchUseCase)
            viewController.bind(to: viewModel)
            viewController.title = "Search"
            
            return .push(viewController)
            
        case .detailPage(let id):
            let viewController = FilmDetailPageViewController()
            let filmDetailUseCase = DetailFilmPageUseCases()
            let viewModel = FilmDetailPageViewModelImpl(router: unownedRouter, detailPageUseCase: filmDetailUseCase, movieId: id)
            viewController.bind(to: viewModel)
            
            return .push(viewController)
        }
    }
}
