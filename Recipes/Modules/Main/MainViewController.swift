//
//  MainViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    let welcomeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        welcomeLabel.font = Fonts.logotype
        welcomeLabel.text = "You are welcome"
        view.addSubview(welcomeLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        welcomeLabel.snp.makeConstraints({ make in
            make.center.equalToSuperview()
        })
    }
    
}
