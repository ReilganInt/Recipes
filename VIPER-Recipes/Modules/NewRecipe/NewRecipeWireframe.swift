//
//  NewRecipeWireframe.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol NewRecipeWireframeProtocol {
    static func makeViewController(delegate: NewRecipeDelegateProtocol?) -> (UIViewController & NewRecipeProtocol)
}

struct NewRecipeWireframe: NewRecipeWireframeProtocol {
    static func makeViewController(delegate: NewRecipeDelegateProtocol?) -> (UIViewController & NewRecipeProtocol) {
        let viewController = NewRecipeViewController()

        let routerDependencies = NewRecipeRouterDependencies()
        let router = NewRecipeRouter(dependencies: routerDependencies, viewController: viewController)

        let interactorDependencies = NewRecipeInteractorDependencies()
        let presenterDependencies = NewRecipePresenterDependencies()

        let interactor = NewRecipeInteractor(dependencies: interactorDependencies)
        let presenter = NewRecipePresenter(dependencies: presenterDependencies, view: viewController, interactor: interactor, router: router, delegate: delegate)
        viewController.setPresenter(presenter)
        
        return viewController
    }
}
