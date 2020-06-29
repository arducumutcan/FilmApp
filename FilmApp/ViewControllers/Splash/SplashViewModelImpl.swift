//
//  SplashViewModelImpl.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation
import RxSwift
import Action
import XCoordinator

class SplashViewModelImpl: SplashViewModel, SplashViewModelInput, SplashViewModelOutput {
    
    private let router: UnownedRouter<AppRoute>
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
    }
    
   func navigateToHome(withPushDelay delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.router.trigger(.homeCoordinator)
        }
    }
}
