//
//  FilmDetailPageViewController.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import RxSwift

class FilmDetailPageViewController: UIViewController, BindableType {
    
    private let filmDetailPage = FilmDetailPageView()
    private let disposeBag = DisposeBag()
    
    var viewModel: FilmDetailPageViewModel!
    
    override func loadView() {
        self.view = filmDetailPage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getFilmDetail()
    }
    
    func bindViewModel() {
        viewModel.output.filmDetail.subscribe { [weak self] (filmDetail) in
            
            guard let element = filmDetail.element else { return }
            self?.setModel(model: element)
            
        }.disposed(by: self.disposeBag)
    }
    
    private func setModel(model: FilmDetailPage) {
        filmDetailPage.titleLabel.text = model.title
        guard let url = URL(string: model.posterUrl) else { return }
        filmDetailPage.filmImageView.kf.setImage(with: url)
    }
    
}
