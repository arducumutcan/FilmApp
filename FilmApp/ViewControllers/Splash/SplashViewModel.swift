//
//  SplashViewModel.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import Foundation

import Foundation
import Action
import RxSwift
import XCoordinator

protocol SplashViewModelInput {
    
}

protocol SplashViewModelOutput {
    
}

protocol SplashViewModel {
    var input: SplashViewModelInput { get }
    var output: SplashViewModelOutput { get }
    
    func navigateToHome(withPushDelay delay: Double)
}

extension SplashViewModel where Self: SplashViewModelInput & SplashViewModelOutput {
    var input: SplashViewModelInput { return self }
    var output: SplashViewModelOutput { return self }
}
