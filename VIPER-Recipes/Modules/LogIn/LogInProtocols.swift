//
//  LogInProtocols.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation
import UIKit

//MARK: Wireframe -
protocol LogInWireframeProtocol: class {

    /* Presenter -> Router */
    func navigate(with type: Navigation)
}
//MARK: Presenter -
protocol LogInPresenterProtocol: class {

    var interactor: LogInInteractorInputProtocol? { get set }
    
    /* ViewController -> Presenter */
    func signIn(_ email: UITextField, _ password: UITextField)
    func signUp()
    func signIn()
}

//MARK: Interactor -
protocol LogInInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func showError(_ message: String)
    func onSuccessAuth()
}

protocol LogInInteractorInputProtocol: class {

    var presenter: LogInInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
    func signIn(_ email: UITextField, _ password: UITextField)
}

//MARK: View -
protocol LogInViewProtocol: class {

    var presenter: LogInPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
    
    func showError(_ message: String)
}

protocol LogInViewDelegate: class {
    func signInButtonClicked()
    func signUpButtonClicked()
    func showError(_ message: String)
}
