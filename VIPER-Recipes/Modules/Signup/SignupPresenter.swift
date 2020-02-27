//
//  SignupPresenter.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SignupPresenterProtocol: class {
    func didReceiveEvent(_ event: SignupEvent)
    func didTriggerAction(_ action: SignupAction)
}

final class SignupPresenter {
    private let dependencies: SignupPresenterDependenciesProtocol
    private weak var view: (SignupViewProtocol & UIViewController)?
    private let interactor: SignupInteractorProtocol
    private let router: SignupRouterProtocol
    private weak var delegate: SignupDelegateProtocol?
    
    init(dependencies: SignupPresenterDependenciesProtocol, 
         view: (SignupViewProtocol & UIViewController), 
         interactor: SignupInteractorProtocol, 
         router: SignupRouterProtocol, 
         delegate: SignupDelegateProtocol?) {
        self.dependencies = dependencies
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
}

extension SignupPresenter: SignupPresenterProtocol {
    func didReceiveEvent(_ event: SignupEvent) {
        switch event {
            case .viewDidLoad:
                debugPrint("viewDidLoad")
        }
    }

    func didTriggerAction(_ action: SignupAction) {
        switch action {
        case .signup: signup()
        }
    }
}

extension SignupPresenter {
    fileprivate func signup() {
        let emailTF = view!.getEmailTextField()
        let passTF = view!.getPasswordtextField()
        let confirmPassTF = view!.getConfirmPasswordtextField()
        interactor.signUp(emailTF, passTF, confirmPassTF, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(_):
                self.view?.dismiss(animated: true, completion: nil)
            }
        })
    }
}
