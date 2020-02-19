//
//  SavesLocalCell.swift
//  VIPER-Recipes
//
//  Created by admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class SavesLocalCell: UICollectionViewCell {
    
    static let id = "SavesLocalCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let containerView: UIView = UIView()
    let nameLabel: UILabel = UILabel()
    let imageView: UIImageView = UIImageView()
    let ratingView: UILabel = UILabel()
    
    private func setup() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(ratingView)
        
        nameLabel.text = "Name"
        ratingView.text = "⭐ ⭐ ⭐ ⭐ ⭐"
        imageView.image = #imageLiteral(resourceName: "1")
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupContraints()
    }
    
    private func setupContraints() {
        containerView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.right.bottom.equalTo(0)
        }
        
        imageView.snp.makeConstraints { make in
            make.left.top.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-50)
            make.height.equalTo(150)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.bottom.equalTo(-20)
        }
        
        ratingView.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.bottom.equalTo(-20)
                
        }
    }
    
}
