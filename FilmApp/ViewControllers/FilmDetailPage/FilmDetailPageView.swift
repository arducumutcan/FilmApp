//
//  FilmDetailPageView.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit

class FilmDetailPageView: UIView {
    
    lazy var filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setHeight(height: 200)
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    private func setupSubViews() {
        backgroundColor = .white
        setupFilmImageviews()
        setupTitleLabel()
    }
    
    private func setupFilmImageviews() {
        addSubview(filmImageView)
        
        filmImageView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        filmImageView.setLeft(equalTo: leftAnchor, constant: 16)
        filmImageView.setRight(equalTo: rightAnchor, constant: -16)
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.setTop(equalTo: filmImageView.bottomAnchor, constant: 16)
        titleLabel.setLeft(equalTo: leftAnchor, constant: 16)
        titleLabel.setRight(equalTo: rightAnchor, constant: -16)
//        titleLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -16).isActive = true

    }
}
