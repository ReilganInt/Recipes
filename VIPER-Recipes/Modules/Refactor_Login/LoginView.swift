//
//  LoginView.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol LoginViewViewProtocol {

}

final class LoginView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
}

extension LoginView: LoginViewViewProtocol {

}

extension LoginView {
  	private func setupView() {
        addSubviews()
        setupConstraints()
        setColors()
  	}

    private func addSubviews() {

    }
    
    private func setupConstraints() {
        
    }

  	private func setColors() {
        backgroundColor = .white
  	}
}
