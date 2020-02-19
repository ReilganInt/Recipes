//
//  SignUpView.swift
//  VIPER-Recipes
//
//  Created by admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    let logotypeLabel = UILabel()
    let emailTextField = TextField()
    let passwordTextField = TextField()
    let confirmPasswordTextField = TextField()
    let signUpButton = UIButton(type: .system)
    let errorLabel = UILabel()
    let backButton = UIButton(type: .system)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.emailTextField, self.passwordTextField, self.confirmPasswordTextField, self.signUpButton, self.backButton, self.errorLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // Properties
    
    var delegate: SignUpViewDelegate?
    
    
    // Lifecycle methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    private func setupUIElements() {
        // Arrange subviews
        setupLogotype()
        setupEmail()
        setupPassword()
        setupConfirmPassword()
        setupSignUpButton()
        setupErrorLabel()
        setupBackButton()
        setupStackView()
    }
    
    private func setupConstraints() {
        // Add constraints to subviews
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
        addSubview(logotypeLabel)
    }
    
    private func setupEmail() {
        emailTextField.placeholder = "Email"
        emailTextField.font = Fonts.regular
        emailTextField.textContentType = .emailAddress
        emailTextField.backgroundColor = Colors.backgroundCards
        emailTextField.layer.cornerRadius = 15
        emailTextField.returnKeyType = .next
    }
    
    private func setupPassword() {
        passwordTextField.placeholder = "Password"
        passwordTextField.font = Fonts.regular
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        passwordTextField.backgroundColor = Colors.backgroundCards
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.returnKeyType = .next
    }
    
    private func setupConfirmPassword() {
        confirmPasswordTextField.placeholder = "Confirm Password"
        confirmPasswordTextField.font = Fonts.regular
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.textContentType = .password
        confirmPasswordTextField.backgroundColor = Colors.backgroundCards
        confirmPasswordTextField.layer.cornerRadius = 15
        confirmPasswordTextField.returnKeyType = .done
    }
    
    private func setupSignUpButton() {
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = Colors.active
        signUpButton.titleLabel?.font = Fonts.regular
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        signUpButton.layer.cornerRadius = 15
    }
    
    private func setupErrorLabel() {
        errorLabel.textColor = Colors.error
        errorLabel.font = Fonts.regular
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping
        errorLabel.alpha = 0
    }
    
    private func setupBackButton() {
        backButton.setTitle("Sign in instead", for: .normal)
        backButton.setTitleColor(Colors.active, for: .normal)
        backButton.titleLabel?.font = Fonts.regular
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    private func setupStackView() {
        addSubview(stackView)
    }
    
    @objc private func signUpButtonClicked() {
        delegate?.signUpButtonClicked()
    }
    
    @objc private func backButtonClicked() {
        delegate?.backButtonClicked()
    }

}


