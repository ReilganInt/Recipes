//
//  LoginView.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit
import AuthenticationServices

protocol LoginViewDelegate {
    func didSignin()
    func didSigninWithApple()
    func didCreateAnAccount()
}

protocol LoginViewViewProtocol {
     func getEmailTextField() -> UITextField
     func getPasswordTextField() -> UITextField
}

final class LoginView: UIView {
    
    var delegate: LoginViewDelegate? = nil
    
    let containerView = UIView()
    
    let logotypeImageView = UIImageView()

    let emailTextField = TextField()
    let passwordTextField = TextField()
    
    let signinButton = UIButton(type: .system)
    let signinWithApple = ASAuthorizationAppleIDButton()
    
    let createAnAccountButton = UIButton(type: .system)
    
    let bottomImageView = UIImageView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signinButton, signinWithApple, createAnAccountButton])
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
    
    override func didMoveToWindow() {
           super.didMoveToWindow()
           setupConstraints()
    }
}

extension LoginView {
    
  	private func setupView() {
        addSubviews()
        setColors()
  	}

    private func addSubviews() {
        addContainerView()
        addBottomImageView()
        addLogotypeImageView()
        addEmailTextField()
        addPasswordtetField()
        addSigninButton()
        addSigninWithApple()
        addCreateAnAccountButton()
        addStackView()
    }
    
    private func setupConstraints() {
   
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
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

extension LoginView {
    
    fileprivate func addContainerView() {
        addSubview(containerView)
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
        passwordTextField.returnKeyType = .done
    }
    
    fileprivate func addSigninButton() {
        signinButton.setTitle("Sign in",  for: .normal)
        signinButton.setTitleColor(.white, for: .normal)
        signinButton.layer.cornerRadius = 15
        signinButton.backgroundColor = UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1)
        signinButton.addTarget(self, action: #selector(didSignin), for: .touchUpInside)
    }
    
    fileprivate func addSigninWithApple() {
        signinWithApple.cornerRadius = 15
        signinWithApple.addTarget(self, action: #selector(didSigninWithApple), for: .touchUpInside)
    }
    
    fileprivate func addCreateAnAccountButton() {
        createAnAccountButton.setTitle("Create an account", for: .normal)
        createAnAccountButton.setTitleColor(UIColor(red: 1/255, green: 167/255, blue: 206/255, alpha: 1), for: .normal)
        createAnAccountButton.addTarget(self, action: #selector(didCreateAnAccount), for: .touchUpInside)
    }
    
    fileprivate func addStackView() {
        containerView.addSubview(stackView)
    }
    
    fileprivate func addBottomImageView() {
        containerView.addSubview(bottomImageView)
        
        bottomImageView.image = #imageLiteral(resourceName: "we")
        bottomImageView.contentMode = .scaleAspectFill
    }
    
}


extension LoginView {
    @objc fileprivate func didSignin() {
        delegate?.didSignin()
    }
    
    @objc fileprivate func didSigninWithApple() {
        delegate?.didSigninWithApple()
    }
    
    @objc fileprivate func didCreateAnAccount() {
        delegate?.didCreateAnAccount()
    }
}

extension LoginView: LoginViewViewProtocol {
    func getPasswordTextField() -> UITextField {
        return passwordTextField
    }
    
    func getEmailTextField() -> UITextField {
        return emailTextField
    }
}

extension LoginView {
   
}
