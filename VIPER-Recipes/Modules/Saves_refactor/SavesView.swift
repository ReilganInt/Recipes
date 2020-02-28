//
//  SavesView.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SavesViewViewProtocol {

}

final class SavesView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
}

extension SavesView: SavesViewViewProtocol {

}

extension SavesView {
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
