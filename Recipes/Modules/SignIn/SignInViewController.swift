//
//  SignInViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    var ui: SignInView? = nil
    
    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkUserUID()
        configureView()
    }
    
     private func configureView() {
        ui = SignInView()
        ui?.delegate = self
        view = ui
    }
    
    /// Check user uid in UserDefaults
    private func checkUserUID() {
        let defaults = UserDefaults.standard
        let uid = defaults.string(forKey: "UserUID")
        
        if uid != nil {
            DispatchQueue.main.async {
                let mainViewController = BubbleTabBarController()
                mainViewController.modalPresentationStyle = .overFullScreen
                self.present(mainViewController, animated: true, completion: nil)
            }
        }
    }
}

extension SignInViewController: SignInViewDelegate {

    func signInButtonClicked() {
        
        // Validate the fields
        let error = ui?.validateFields()
        
        if error != nil {
            
            // There's somethins wrong with the fields
            // show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let email = ui?.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = ui?.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // SignIn the user
            Auth.auth().signIn(withEmail: email!, password: password!) { (result, err) in
                if err != nil {
                    // There was an error creating the user
                    self.showError("\(err!.localizedDescription)")
                }
                else {
                    let defaults = UserDefaults.standard
                    defaults.set(result?.user.uid, forKey: "UserUID")
                    
                    let mainViewController = BubbleTabBarController()
                    mainViewController.modalPresentationStyle = .overFullScreen
                    self.present(mainViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func signUpButtonClicked() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .overFullScreen
        present(signUpViewController, animated: true, completion: nil)
    }
    
    func showError(_ message: String) {
        ui?.errorLabel.text = message
        ui?.errorLabel.alpha = 1
    }
    
}
