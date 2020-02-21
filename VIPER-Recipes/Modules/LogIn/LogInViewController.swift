//
//  LogInViewController.swift
//  VIPER-Recipes
//
//  Created Rinat Kutuev on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

	var presenter: LogInPresenterProtocol?
    var ui: LogInView? = nil
    
    
    override func loadView() {
        super.loadView()
        ui = LogInView() 
    }
    
	override func viewDidLoad() {
        super.viewDidLoad()
        ui?.delegate = self
        view = ui
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        checkUserUID()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// Check user uid in UserDefaults
    private func checkUserUID() {
        let defaults = UserDefaults.standard
        let uid = defaults.string(forKey: "UserUID")
        
        if uid != nil {
            presenter?.signIn()
        }
    }
}

extension LogInViewController: LogInViewDelegate {
    
    func signInButtonClicked() {
        presenter?.signIn(ui!.emailTextField, ui!.passwordTextField)
    }
    
    func signUpButtonClicked() {
        presenter?.signUp()
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            self.ui?.errorLabel.text = message
            self.ui?.errorLabel.alpha = 1
        }
    }
}

extension LogInViewController: LogInViewProtocol {

}
