//
//  SignUpInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Firebase

class SignUpInteractor: SignUpInteractorInputProtocol {

    weak var presenter: SignUpInteractorOutputProtocol?
    
    func signUp(_ email: UITextField, _ password: UITextField, _ confirmPassword: UITextField) {
        // Validate the fields
        let error = Utilities.validateFields(email, password, confirmPassword)
        
        if error != nil {
            
            // There's somethins wrong with the fields
            // show error message
            presenter?.showError(error!)
        } else {
            
            // Create cleaned versions of the data
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    self.presenter?.showError("Error creating the user")
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
                self.presenter?.onSuccessSignUp()
            }
        }
    }
}
