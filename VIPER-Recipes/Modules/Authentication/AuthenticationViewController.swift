//
//  AuthenticationViewController.swift
//  VIPER-Recipes
//
//  Created by admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        checkUserDefaults()
        
    }
    
    private func checkUserDefaults() {
        let defaults = UserDefaults.standard
        let key = defaults.string(forKey: "UserUID")
        if key != nil {
            DispatchQueue.main.async {
                let vc = MainTabBarController()
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
        } else {
            DispatchQueue.main.async {
                let vc = LoginWireframe.makeViewController(delegate: nil)
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
        }
    }
}
