//
//  SignupView.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SignupViewDelegate {
    func didSignup()
}

protocol SignupViewViewProtocol {
    func getPasswordTextField() -> UITextField
    func getEmailTextField() -> UITextField
    func getConfirmPasswordTextField() -> UITextField
}

final class SignupView: UIView {
    
    var delegate: SignupViewDelegate? = nil
    
    let containerView = UIView()
    
    let logotypeImageView = UIImageView()

    let emailTextField = TextField()
    let passwordTextField = TextField()
    let confirmPasswordTextField = TextField()
    
    let signupButton = UIButton(type: .system)
    
    let bottomImageView = UIImageView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, confirmPasswordTextField, signupButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Use init(frame:) instead")
    }
}

extension SignupView: SignupViewViewProtocol {
    func getPasswordTextField() -> UITextField {
        return passwordTextField
    }
    
    func getConfirmPasswordTextField() -> UITextField {
        return confirmPasswordTextField
    }
    
    func getEmailTextField() -> UITextField {
        return emailTextField
    }
}

extension SignupView {
  	private func setupView() {
        addSubviews()
        setupConstraints()
        setColors()
  	}

    private func addSubviews() {
        addContainerView()
        addBottomImageView()
        addLogotypeImageView()
        addEmailTextField()
        addPasswordtetField()
        addConfirmPasswordtextField()
        addSignupButton()
        addStackView()
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        logotypeImageView.translatesAutoresizingMaskIntoConstraints = false
        logotypeImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        logotypeImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logotypeImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        logotypeImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -100).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -50).isActive = true
        stackView.topAnchor.constraint(equalTo: logotypeImageView.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }

  	private func setColors() {
        backgroundColor = .white
  	}
}

extension SignupView {
    fileprivate func addContainerView() {
        addSubview(containerView)
    }
    
    fileprivate func addBottomImageView() {
        containerView.addSubview(bottomImageView)
        
        bottomImageView.image = #imageLiteral(resourceName: "we")
        bottomImageView.contentMode = .scaleAspectFill
    }
    
    fileprivate func addLogotypeImageView() {
        containerView.addSubview(logotypeImageView)
        
        logotypeImageView.image = #imageLiteral(resourceName: "lo")
        logotypeImageView.contentMode = .scaleAspectFill
    }
    
    fileprivate func addEmailTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.textContentType = .emailAddress
        emailTextField.layer.cornerRadius = 15
        emailTextField.returnKeyType = .next
    }
    
    fileprivate func addPasswordtetField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.returnKeyType = .next
    }

    fileprivate func addConfirmPasswordtextField() {
        confirmPasswordTextField.placeholder = "Confirm you password"
        confirmPasswordTextField.textContentType = .password
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.layer.cornerRadius = 15
        confirmPasswordTextField.returnKeyType = .next
    }
    
    fileprivate func addSignupButton() {
        signupButton.setTitle("Create account",  for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.layer.cornerRadius = 15
        signupButton.backgroundColor = UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1)
        signupButton.addTarget(self, action: #selector(didSignup), for: .touchUpInside)
    }
    
    fileprivate func addStackView() {
        containerView.addSubview(stackView)
    }
    
}

extension SignupView {
    @objc fileprivate func didSignup() {
        delegate?.didSignup()
    }
}
