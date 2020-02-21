//
//  LogInPresenter.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LogInPresenter: LogInPresenterProtocol {

    weak private var view: LogInViewProtocol?
    var interactor: LogInInteractorInputProtocol?
    private let router: LogInWireframeProtocol

    init(interface: LogInViewProtocol, interactor: LogInInteractorInputProtocol?, router: LogInWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func signIn(_ email: UITextField, _ password: UITextField) {
        interactor?.signIn(email, password)
    }
    
    func signIn() {
        router.navigate(with: .successAuth)
    }
    
    func signUp() {
        router.navigate(with: .signUp)
    }
}

extension LogInPresenter: LogInInteractorOutputProtocol {
    func onSuccessAuth() {
        router.navigate(with: .successAuth)
    }
    
    func showError(_ message: String) {
        view?.showError(message)
    }
}