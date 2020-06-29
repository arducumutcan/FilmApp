//
//  SplashViewController.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import XCoordinator

class SplashViewController: UIViewController, BindableType {

    
    
    private let splashView = SplashView()
    var viewModel: SplashViewModel!

    override func loadView() {
        self.view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseFetchRemoteConfig()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func bindViewModel() {
        
    }
    
    private func firebaseFetchRemoteConfig() {
        FireBaseManager.setupRemoteConfigDefaults()
        FireBaseManager.fetchRemoteConfig { [unowned self] (companyName) in
            self.splashView.companyNamelabel.text = companyName
            self.viewModel.navigateToHome(withPushDelay: 3.0)
        }
    }
}
