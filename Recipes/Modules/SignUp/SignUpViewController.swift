//
//  SignUpViewController.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class SignUpViewController: UIViewController {
    
    var ui: SignUpView? = nil
    
    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureView()
    }
    
    private func configureView() {
        ui = SignUpView()
        ui?.delegate = self
        view = ui
    }

}

extension SignUpViewController: SignUpViewDelegate {
    
    func signUpButtonClicked() {
        
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
            
            // Create the user
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, err) in
                
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.showError("Error creating the user")
                }
                else {
                    /* Save user data to firestore
                    // User was created successfully
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "LastName": "Popov",
                        "firstname": "Dima",
                        "uid": result!.user.uid
                    ]) { error in
                        if error != nil {
                            // Show error message
                            self.showError("User data couldn't be save")
                        }
                    }
                    */
                }
                
                // Transition to the home screen
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func backButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    func showError(_ message: String) {
        ui?.errorLabel.text = message
        ui?.errorLabel.alpha = 1
    }
}

