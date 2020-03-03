//
//  LoginInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import Firebase

protocol LoginInteractorProtocol {
    func signIn(_ email: UITextField, _ password: UITextField, completion: @escaping (Result<Void, Error>) -> ())
}

final class LoginInteractor {
    private let dependencies: LoginInteractorDependenciesProtocol
    
    init(dependencies: LoginInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension LoginInteractor: LoginInteractorProtocol {
    
	func signIn(_ email: UITextField, _ password: UITextField, completion: @escaping (Result<Void, Error>) -> ()) {
        // Validate the fields
        let error = Utilities.validateFields(email, password)
        
        if error != nil {
            // There's somethins wrong with the fields
            // show error message
            completion(.failure(NSError(domain: "textfileds is nil", code: 0, userInfo: [:])))
        } else {
            
            // Create cleaned versions of the data
            let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // SignIn the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    // There was an error creating the user
                    // self.presenter?.showError("\(err!.localizedDescription)")
                    completion(.failure(err!))
                }
                else {
                    // TODO: Delete UserDefaults and Use KeyChain!
                    let defaults = UserDefaults.standard
                    defaults.set(result?.user.uid, forKey: "UserUID")
                    completion(.success(()))
                    // self.presenter?.onSuccessAuth()
                }
            }
        }
    }
    
}
