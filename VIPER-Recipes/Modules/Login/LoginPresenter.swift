//
//  LoginPresenter.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol: class {
    func didReceiveEvent(_ event: LoginEvent)
    func didTriggerAction(_ action: LoginAction)
}

final class LoginPresenter {
    private let dependencies: LoginPresenterDependenciesProtocol
    private weak var view: (LoginViewProtocol & UIViewController)?
    private let interactor: LoginInteractorProtocol
    private let router: LoginRouterProtocol
    private weak var delegate: LoginDelegateProtocol?
    
    init(dependencies: LoginPresenterDependenciesProtocol, 
         view: (LoginViewProtocol & UIViewController), 
         interactor: LoginInteractorProtocol, 
         router: LoginRouterProtocol, 
         delegate: LoginDelegateProtocol?) {
        self.dependencies = dependencies
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func didReceiveEvent(_ event: LoginEvent) {
        switch event {
            case .viewDidLoad:
                debugPrint("viewDidLoad")
        }
    }

    func didTriggerAction(_ action: LoginAction) {
        switch action {
        case .signIn: signIn()
        case .signInWithApple: signInWithApple()
        case .createAnAccount: createAnAccount()
        }
    }
}

extension LoginPresenter {
    fileprivate func signIn() {
        let emailTF = view!.getEmailTextField()
        let passwordTF = view!.getPasswordtextField()
        interactor.signIn(emailTF, passwordTF, completion: { result in
            switch result {
            case .failure(let err):
                print(err.localizedDescription)
            case .success(_):
                self.router.navigate(toRoute: .main)
            }
        })
    }
    
    fileprivate func signInWithApple() {
        print("signInWithApple")
    }
    
    fileprivate func createAnAccount() {
        router.navigate(toRoute: .createAnAccount)
    }
}
