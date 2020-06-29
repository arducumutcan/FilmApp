//
//  SplashView.swift
//  FilmApp
//
//  Created by Umut Can ARDUC on 28.06.2020.
//  Copyright © 2020 Umut Can ARDUC. All rights reserved.
//

import UIKit

class SplashView: UIView {
    
    lazy var companyNamelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func createSubviews() {
        backgroundColor = .blue
        addSubview(companyNamelabel)
        
        companyNamelabel.setLeft(equalTo: leftAnchor, constant: 10)
        companyNamelabel.setRight(equalTo: rightAnchor, constant: 10)
        
        companyNamelabel.setCenterX(equalTo: centerXAnchor)
        companyNamelabel.setCenterY(equalTo: centerYAnchor)

    }
}
