//
//  AppRouter.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import XCoordinator


enum AppRoute: Route {
    case splash
    case homeCoordinator
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .splash)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        
        switch route {
        case .splash:
            
            let viewController = SplashViewController()
            let viewModel = SplashViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)

            return .push(viewController)
            
       
        case .homeCoordinator:
            let coordinator = HomeCoordinator()
        
            return .presentFullScreen(coordinator, animation: .none)
        }
    }
}
