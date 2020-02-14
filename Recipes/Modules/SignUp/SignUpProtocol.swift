//
//  SignUpProtocol.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

/// SignUpView Delegate
protocol SignUpViewDelegate {
    // This will be implemented in the ViewController.
    func signUpButtonClicked()
    func backButtonClicked()
    func showError(_ message: String)
}
