//
//  HomeView.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.setHeight(height: 50)
        searchBar.placeholder = "Search Films"
        
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func createSubViews() {
        setupSearchBar()
        setupTableView()
    }
    
    private func setupSearchBar() {
        addSubview(searchBar)
        
        searchBar.setTop(equalTo: view.safeAreaLayoutGuide.topAnchor)
        searchBar.setLeft(equalTo: leftAnchor)
        searchBar.setRight(equalTo: rightAnchor)
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.setTop(equalTo: searchBar.bottomAnchor)
        tableView.setLeft(equalTo: leftAnchor)
        tableView.setRight(equalTo: rightAnchor)
        tableView.setBottom(equalTo: bottomAnchor)
    }
}
