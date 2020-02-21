//
//  MoreView.swift
//  VIPER-Recipes
//
//  Created by admin on 21.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

class MoreView: UIView {

    var delegate: MoreViewDelegate?
    
    
    // Lifecycle methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    private func setupUIElements() {
        
    }
    
    private func setupConstraints() {
        
    }

}
