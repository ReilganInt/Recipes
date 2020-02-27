//
//  SignupRouter.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SignupRouterProtocol {
    func navigate(toRoute route: SignupRoute)
    func dismiss(animated: Bool)
}

final class SignupRouter {
    private let dependencies: SignupRouterDependenciesProtocol
    private weak var viewController: UIViewController?

    init(dependencies: SignupRouterDependenciesProtocol,
    	 viewController: UIViewController?) {
        self.dependencies = dependencies
        self.viewController = viewController
    }
}

extension SignupRouter: SignupRouterProtocol {
	func navigate(toRoute route: SignupRoute) {
        switch route {
            default: ()
        }
    }

    func dismiss(animated: Bool) {
		viewController?.dismiss(animated: animated, completion: nil)
	}
}
