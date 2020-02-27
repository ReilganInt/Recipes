//
//  Utilities.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    /// Check the password is correct with pridicate
    static func isPasswordValid(_ password: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return predicate.evaluate(with: password)
    }
    
    /// Check the fields and validate that the data is
    /// correct. if everything is correct, this method returns nil.
    /// Otherwise, it returns the error message
    static func validateFields(_ email: UITextField, _ password: UITextField) -> String? {
        
       // Check that all fields are filled in
        if email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        return nil
    }
    
    static func validateFields(_ email: UITextField, _ password: UITextField, _ confirmPassword: UITextField) -> String? {
        
        // Check that all fields are filled in
        if email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedConfirmPassword = confirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedPassword != cleanedConfirmPassword {
            return "Those password didn't match. Try again."
        }
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
}
