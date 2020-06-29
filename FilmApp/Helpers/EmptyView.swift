//
//  EmptyView.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    // MARK: - Outlets
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "notfound")
        imageView.setWidth(width: 100)
        imageView.setHeight(height: 100)
        
        return imageView
    }()
    
    lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Movies not found."
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: - Subviews
    
    private func createSubviews() {
        setupContentView()
        setupIconImage()
        setupErrorMessageLabel()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        contentView.setLeft(equalTo: leftAnchor)
        contentView.setRight(equalTo: rightAnchor)
        contentView.setCenterX(equalTo: centerXAnchor)
        contentView.setCenterY(equalTo: centerYAnchor, constant: -50)
    }
    
    private func setupIconImage() {
        addSubview(iconImageView)
        iconImageView.setCenterX(equalTo: contentView.centerXAnchor)
        iconImageView.setTop(equalTo: contentView.topAnchor, constant: -100)
    }
    
    private func setupErrorMessageLabel() {
        addSubview(errorMessageLabel)
        errorMessageLabel.setTop(equalTo: iconImageView.bottomAnchor, constant: 20)
        errorMessageLabel.setLeft(equalTo: contentView.leftAnchor, constant: 20)
        errorMessageLabel.setRight(equalTo: contentView.rightAnchor, constant: -20)
        errorMessageLabel.setHeight(height: 21)
    }
}
