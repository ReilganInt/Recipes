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
    
    // Private UI properties
    
    private let logotypeLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let confirmPasswordTextField = UITextField()
    private let signUpButton = UIButton(type: .system)
    private let errorLabel = UILabel()
    private let backButton = UIButton(type: .system)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField, self.confirmPasswordTextField, self.signUpButton, self.backButton, self.errorLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConstraints()
    }
    
    private func configureView() {
        setupLogotype()
        setupEmail()
        setupPassword()
        setupConfirmPassword()
        setupSignUpButton()
        setupErrorLabel()
        setupBackButton()
        setupStackView()
    }
    
    /// Setup constraints for view
    private func setupConstraints() {
        logotypeLabel.snp.makeConstraints({ make in
            make.top.equalTo(200)
            make.centerX.equalToSuperview()
        })
        emailTextField.snp.makeConstraints { make in
            make.width.equalTo(325)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.width.equalTo(325)
            make.height.equalTo(50)
        }
        confirmPasswordTextField.snp.makeConstraints { make in
            make.width.equalTo(325)
            make.height.equalTo(50)
        }
        stackView.snp.makeConstraints({ make in
            make.top.equalTo(400)
            make.centerX.equalToSuperview()
        })
    }
    
    private func setupLogotype() {
        logotypeLabel.text = "Recipes"
        logotypeLabel.font = Fonts.logotype
        view.addSubview(logotypeLabel)
    }
    
    private func setupEmail() {
        emailTextField.placeholder = "Email"
        emailTextField.font = Fonts.regular
        emailTextField.textContentType = .emailAddress
    }
    
    private func setupPassword() {
        passwordTextField.placeholder = "Password"
        passwordTextField.font = Fonts.regular
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
    }
    
    private func setupConfirmPassword() {
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.font = Fonts.regular
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.textContentType = .password
    }
    
    private func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(Colors.Button.Title.defaultColor, for: .normal)
        signUpButton.backgroundColor = Colors.Button.Background.defaultColor
        signUpButton.titleLabel?.font = Fonts.regular
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    
    private func setupErrorLabel() {
        errorLabel.textColor = Colors.Label.error
        errorLabel.font = Fonts.regular
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.alpha = 0
    }
    
    private func setupBackButton() {
        backButton.setTitle("Sign in instead", for: .normal)
        backButton.setTitleColor(Colors.Button.Title.backColor, for: .normal)
        backButton.titleLabel?.font = Fonts.regular
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    private func setupStackView() {
        view.addSubview(stackView)
    }
    
    // Actions
    @objc private func signUpButtonClicked() {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's somethins wrong with the fields
            // show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
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
    
    @objc private func backButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    // Check the fields and validate that the data is
    // correct. if everything is correct, this method returns nil.
    // Otherwise, it returns the error message
    private func validateFields() -> String? {
        
        // Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            confirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanedConfirmPassword = confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if cleanedPassword != cleanedConfirmPassword {
            return "Those password didn't match. Try again."
        }
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}

