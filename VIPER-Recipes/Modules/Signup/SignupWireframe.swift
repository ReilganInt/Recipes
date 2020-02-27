//
//  SignupWireframe.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SignupWireframeProtocol {
    static func makeViewController(delegate: SignupDelegateProtocol?) -> (UIViewController & SignupProtocol)
}

struct SignupWireframe: SignupWireframeProtocol {
    static func makeViewController(delegate: SignupDelegateProtocol?) -> (UIViewController & SignupProtocol) {
        let viewController = SignupViewController()

        let routerDependencies = SignupRouterDependencies()
        let router = SignupRouter(dependencies: routerDependencies, viewController: viewController)

        let interactorDependencies = SignupInteractorDependencies()
        let presenterDependencies = SignupPresenterDependencies()

        let interactor = SignupInteractor(dependencies: interactorDependencies)
        let presenter = SignupPresenter(dependencies: presenterDependencies, view: viewController, interactor: interactor, router: router, delegate: delegate)
        viewController.setPresenter(presenter)
        
        return viewController
    }
}
