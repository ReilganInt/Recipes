//
//  SignInProtocol.swift
//  Recipes
//
//  Created by admin on 14.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

/// SignUpView Delegate
protocol SignInViewDelegate {
    // This will be implemented in the ViewController.
    func signInButtonClicked()
    func signUpButtonClicked()
    func showError(_ message: String)
}
