//
//  HomeViewController.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import RxSwift
import JGProgressHUD
class HomeViewController: UIViewController, BindableType {
    
    private let homeView = HomeView()
    private let disposeBag = DisposeBag()
    private let cellIdentifier = String(describing: FilmTableViewCell.self)
    private let progressHud = JGProgressHUD(style: .light)
    private var isFirstLoading = true
    
    
    var viewModel: HomeViewModel!
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewCell()
        self.progressHud.textLabel.text = "Loading..."
    }
    
    func bindViewModel() {
        
        homeView.searchBar.rx.text.asObservable().throttle(0.5, scheduler: MainScheduler.instance).subscribe (onNext: { [weak self] (searchText) in
            
            self?.isFirstLoading = false
            self?.progressHud.show(in: self!.view)
            
            self?.viewModel.searchFilms(apiKey: ServiceConstants.apiKey, searchText: self?.homeView.searchBar.text ?? "")
            
        }).disposed(by: self.disposeBag)
        
        viewModel.output.filmList.subscribe(onNext: { event in
            self.progressHud.dismiss()
            
            guard event.count == 0, !self.isFirstLoading else { return }
            
            self.isFirstLoading = false
            self.homeView.tableView.backgroundView = EmptyView()
            
        }).disposed(by: self.disposeBag)
        
        viewModel.output.filmList.bind(to: homeView.tableView.rx.items(cellIdentifier: cellIdentifier, cellType: FilmTableViewCell.self)) { row, model, cell in
            
            cell.setCell(model: model)
            
        }.disposed(by: self.disposeBag)
        
        homeView.tableView.rx.modelSelected(Film.self).subscribe(onNext: { event in
            self.viewModel.navigateToFilmDetailPage(filmId: event.imdbId)
        }).disposed(by: self.disposeBag)
    }
    
    private func configureTableViewCell() {
        homeView.tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        homeView.tableView.estimatedRowHeight = 100
        homeView.tableView.rowHeight = UITableView.automaticDimension
    }
}
