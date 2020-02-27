//
//  LoginWireframe.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol LoginWireframeProtocol {
    static func makeViewController(delegate: LoginDelegateProtocol?) -> (UIViewController & LoginProtocol)
}

struct LoginWireframe: LoginWireframeProtocol {
    static func makeViewController(delegate: LoginDelegateProtocol?) -> (UIViewController & LoginProtocol) {
        let viewController = LoginViewController()

        let routerDependencies = LoginRouterDependencies()
        let router = LoginRouter(dependencies: routerDependencies, viewController: viewController)

        let interactorDependencies = LoginInteractorDependencies()
        let presenterDependencies = LoginPresenterDependencies()

        let interactor = LoginInteractor(dependencies: interactorDependencies)
        let presenter = LoginPresenter(dependencies: presenterDependencies, view: viewController, interactor: interactor, router: router, delegate: delegate)
        viewController.setPresenter(presenter)
        
        return viewController
    }
}
