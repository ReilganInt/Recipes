//
//  SignupViewController.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SignupViewProtocol: SignupProtocol {
    func setPresenter(_ presenter: SignupPresenterProtocol)
}

final class SignupViewController: UIViewController {
    private var presenter: SignupPresenterProtocol?

    private lazy var rootView: (UIView & SignupViewViewProtocol) = {
        let view = SignupView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.didReceiveEvent(.viewDidLoad)
    }
}

extension SignupViewController: SignupViewProtocol {
    func setPresenter(_ presenter: SignupPresenterProtocol) {
        self.presenter = presenter
    }
}

extension SignupViewController: SignupProtocol {
    func getConfirmPasswordtextField() -> UITextField {
        let tf = (rootView as SignupViewViewProtocol).getConfirmPasswordTextField()
        return tf
    }
    
    func getEmailTextField() -> UITextField {
        let tf = (rootView as SignupViewViewProtocol).getEmailTextField()
        return tf
    }
    
    func getPasswordtextField() -> UITextField {
        let tf = (rootView as SignupViewViewProtocol).getPasswordTextField()
        return tf
  }
}

extension SignupViewController {
    private func setupView() {
        addSubviews()
        setupConstraints()
        setColors()
    }

    private func addSubviews() {
        view.addSubview(rootView)
    }
    
    private func setupConstraints() {
        rootView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        rootView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        rootView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rootView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func setColors() {
        view.backgroundColor = .white
    }
}

extension SignupViewController: SignupViewDelegate {
    func didSignup() {
        presenter?.didTriggerAction(.signup)
    }
}

extension SignupViewController {
    
}
