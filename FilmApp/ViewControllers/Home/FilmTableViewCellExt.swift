//
//  FilmTableViewCellExt.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit

extension FilmTableViewCell {
    
    func setupSubViews() {
        setupStoresContentView()
    }
    
    private func setupStoresContentView() {
        addSubview(filmContentView)
        
        filmContentView.setTop(equalTo: topAnchor, constant: 10)
        filmContentView.setLeft(equalTo: leftAnchor, constant: 10)
        filmContentView.setRight(equalTo: rightAnchor, constant: -10)
        filmContentView.setBottom(equalTo: bottomAnchor, constant: -10)
        
        setupFilmImageView()
        setupTitleLabel()
    }
    
    private func setupFilmImageView() {
        filmContentView.addSubview(filmImageView)
        
        filmImageView.setTop(equalTo: filmContentView.topAnchor, constant: 10)
        filmImageView.setLeft(equalTo: filmContentView.leftAnchor, constant: 10)
    }
    
    private func setupTitleLabel() {
        filmContentView.addSubview(titleLabel)
        
        titleLabel.setTop(equalTo: filmContentView.topAnchor, constant: 10)
        titleLabel.setLeft(equalTo: filmImageView.rightAnchor, constant: 10)
        titleLabel.setRight(equalTo: filmContentView.rightAnchor, constant:  -10)
        titleLabel.setBottom(equalTo: filmContentView.bottomAnchor, constant: -10)

    }
}
