//
//  LoginView.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol LoginViewViewProtocol {

}

class AppSettings {
    
    static var fontSize: Int = 14
    
    enum Margins {
        static var left = 20
        static var top = 20
    }
    
    enum Bounds {
        static var height = 50
        static var width = 270
    }
    
    static func getSettings() {
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S: print("default value")
        case .iPhone6, .iPhone7, .iPhone8, .iPhone6S, .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax, .iPhone11, .iPhone11Pro, .iPhone11ProMax:
            AppSettings.fontSize += 6
            AppSettings.Bounds.width += 55
            AppSettings.Margins.left += 30
        default: break
        }
    }
}

final class LoginView: UIView {
    
    let logotypeImageView = UIImageView()
    let welcomeMessageLabel = UILabel()

    let emailTextField = TextField()
    let passwordTextField = TextField()
    
    let forgotPasswordButton = UIButton(type: .system)
    
    let signinButton = UIButton(type: .system)
    let signinWithApple = UIButton(type: .system)
    
    let createAnAccountButton = UIButton(type: .system)
    
    let bottomImageView = UIImageView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, forgotPasswordButton, signinButton, signinWithApple, createAnAccountButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        AppSettings.getSettings()
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

extension LoginView: LoginViewViewProtocol {

}

extension LoginView {
    
  	private func setupView() {
        addSubviews()
        setColors()
  	}

    private func addSubviews() {
        addLogotypeImageView()
        addWelcomeMessageLabel()
        addEmailTextField()
        addPasswordtetField()
        addForgotPasswordButton()
        addSigninButton()
        addSigninWithApple()
        addCreateAnAccountButton()
        addStackView()
        addBottomImageView()
    }
    
    private func setupConstraints() {
        logotypeImageView.snp.makeConstraints({ make in
            make.top.equalTo(AppSettings.Margins.top)
            make.left.equalTo(AppSettings.Margins.left)
            make.width.height.equalTo(150)
        })
        welcomeMessageLabel.snp.makeConstraints({ make in
            make.top.equalTo(logotypeImageView.snp.bottom).offset(AppSettings.Margins.top)
            make.width.equalTo(250)
            make.left.equalTo(AppSettings.Margins.left)
        })
        
        emailTextField.snp.makeConstraints({ make in
            make.height.equalTo(AppSettings.Bounds.height)
            make.width.equalTo(AppSettings.Bounds.width)
        })
        
        passwordTextField.snp.makeConstraints({ make in
            make.height.equalTo(AppSettings.Bounds.height)
            make.width.equalTo(AppSettings.Bounds.width)
        })
        
        stackView.snp.makeConstraints({ make in
            make.top.equalTo(welcomeMessageLabel.snp.bottom).offset(AppSettings.Margins.top)
            make.centerX.equalToSuperview()
        })
    }

  	private func setColors() {
        backgroundColor = .white
  	}
}

extension LoginView {
    fileprivate func addLogotypeImageView() {
        addSubview(logotypeImageView)
        
        logotypeImageView.image = #imageLiteral(resourceName: "logotype")
        logotypeImageView.contentMode = .scaleAspectFill
    }
    
    fileprivate func addWelcomeMessageLabel() {
        addSubview(welcomeMessageLabel)
        
        welcomeMessageLabel.text = "The best way to save your recipes"
        welcomeMessageLabel.numberOfLines = 0
        welcomeMessageLabel.font = UIFont(name: "Roboto-Medium", size: CGFloat(AppSettings.fontSize + 6))
        welcomeMessageLabel.textColor = UIColor(red: 61/255, green: 90/255, blue: 108/255, alpha: 1)
        
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
    
    fileprivate func addForgotPasswordButton() {
        
    }
    
    fileprivate func addSigninButton() {
        
    }
    
    fileprivate func addSigninWithApple() {
        
    }
    
    fileprivate func addCreateAnAccountButton() {
        
    }
    
    fileprivate func addStackView() {
        addSubview(stackView)
    }
    
    fileprivate func addBottomImageView() {
        addSubview(bottomImageView)
    }
    
}
