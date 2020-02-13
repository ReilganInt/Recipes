//
//  MoreViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import Firebase

class MoreViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(logoutButtonClicked))
        title = "More"
    }
    
    @objc private func logoutButtonClicked() {
        let alertController = UIAlertController(title: "Logout", message: "Do you realy want to exit?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "EXIT", style: .destructive, handler: { action in
            
            do {
                try Auth.auth().signOut()
            } catch {
                print(error.localizedDescription)
            }
            
            let defaults = UserDefaults.standard
            defaults.removeObject(forKey: "UserUID")
            
            self.dismiss(animated: true, completion: nil)

        }))
        alertController.addAction(UIAlertAction(title: "back", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }

}
