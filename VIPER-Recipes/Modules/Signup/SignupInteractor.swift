//
//  SignupInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import Firebase

protocol SignupInteractorProtocol {
    func signUp(_ email: UITextField, _ password: UITextField, _ confirmPassword: UITextField, completion: @escaping (Result<Void, Error>) -> ())
}

final class SignupInteractor {
    private let dependencies: SignupInteractorDependenciesProtocol
    
    init(dependencies: SignupInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension SignupInteractor: SignupInteractorProtocol {
    
    func signUp(_ email: UITextField, _ password: UITextField, _ confirmPassword: UITextField, completion: @escaping (Result<Void, Error>) -> ()) {
        // Validate the fields
        let err = Utilities.validateFields(email, password, confirmPassword)
        
        if err != nil {
            
            // There's somethins wrong with the fields
            // show error message
            completion(.failure(NSError(domain: "textfileds is nil", code: 0, userInfo: [:])))
        } else {
            
            // Create cleaned versions of the data
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    // There was an error creating the user
                    completion(.failure(err!))
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
                completion(.success(()))
            }
        }
    }
}
