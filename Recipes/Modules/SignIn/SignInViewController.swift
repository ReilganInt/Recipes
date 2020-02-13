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

    // Private UI properties
    
    private let logotypeLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let signInButton = UIButton(type: .system)
    private let signUpButton = UIButton(type: .system)
    private let errorLabel = UILabel()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField, self.signInButton, self.signUpButton, self.errorLabel])
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
        checkUserUID()
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
        setupSignInButton()
        setupSignUpButton()
        setupErrorLabel()
        setupStackView()
    }
    
    /// Check user uid in UserDefaults
    private func checkUserUID() {
        let defaults = UserDefaults.standard
        let uid = defaults.string(forKey: "UserUID")
        
        if uid != nil {
            DispatchQueue.main.async {
                let mainViewController = MainViewController()
                mainViewController.modalPresentationStyle = .overFullScreen
                self.present(mainViewController, animated: true, completion: nil)
            }
        }
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
        signInButton.snp.makeConstraints { make in
            make.width.equalTo(325)
            make.height.equalTo(50)
        }
        signUpButton.snp.makeConstraints { make in
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
    
    private func setupSignInButton() {
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(Colors.Button.Title.defaultColor, for: .normal)
        signInButton.backgroundColor = Colors.Button.Background.defaultColor
        signInButton.titleLabel?.font = Fonts.regular
        signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
    }
    
    private func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(Colors.Button.Background.defaultColor, for: .normal)
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
    
    private func setupStackView() {
        view.addSubview(stackView)
    }
    
    // Check the fields and validate that the data is
    // correct. if everything is correct, this method returns nil.
    // Otherwise, it returns the error message
    private func validateFields() -> String? {
        
        // Check that all fields are filled in
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
    
        return nil
    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    // Actions
    
    @objc private func signInButtonClicked() {
        
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
            
            // SignIn the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    // There was an error creating the user
                    self.showError("\(err!.localizedDescription)")
                }
                else {
                    let defaults = UserDefaults.standard
                    defaults.set(result?.user.uid, forKey: "UserUID")
                    
                    let mainViewController = MainViewController()
                    mainViewController.modalPresentationStyle = .overFullScreen
                    self.present(mainViewController, animated: true, completion: nil)
                }
                
            }
            
            
        }
        
        
    }

    @objc private func signUpButtonClicked() {
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .overFullScreen
        present(signUpViewController, animated: true, completion: nil)
    }

}
