//
//  FilmTableViewCell.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 29.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit
import Kingfisher

class FilmTableViewCell: UITableViewCell {
    lazy var filmContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        view.heightAnchor.constraint(greaterThanOrEqualToConstant: 80).isActive = true
        
        return view
    }()
    
    lazy var filmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.setHeight(height: 50)
        imageView.setWidth(width: 50)
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupSubViews()
        filmContentView.layoutIfNeeded()
    }
    
    func setCell(model: Film) {
        titleLabel.text = "\(model.title) \n \n \(model.type) - \(model.year)"
        guard let url = URL(string: model.posterUrl) else { return }
        filmImageView.kf.setImage(with: url)
        
    }
}
