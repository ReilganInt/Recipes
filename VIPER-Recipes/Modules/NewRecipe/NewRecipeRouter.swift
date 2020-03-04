//
//  NewRecipeRouter.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol NewRecipeRouterProtocol {
    func navigate(toRoute route: NewRecipeRoute)
    func dismiss(animated: Bool)
}

final class NewRecipeRouter {
    private let dependencies: NewRecipeRouterDependenciesProtocol
    private weak var viewController: UIViewController?

    init(dependencies: NewRecipeRouterDependenciesProtocol,
    	 viewController: UIViewController?) {
        self.dependencies = dependencies
        self.viewController = viewController
    }
}

extension NewRecipeRouter: NewRecipeRouterProtocol {
	func navigate(toRoute route: NewRecipeRoute) {
        switch route {
            default: ()
        }
    }

    func dismiss(animated: Bool) {
            self.viewController?.dismiss(animated: animated, completion: nil)
		
	}
}
