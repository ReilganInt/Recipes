//
//  LoginRouter.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    func navigate(toRoute route: LoginRoute)
    func dismiss(animated: Bool)
}

final class LoginRouter {
    private let dependencies: LoginRouterDependenciesProtocol
    private weak var viewController: UIViewController?

    init(dependencies: LoginRouterDependenciesProtocol,
    	 viewController: UIViewController?) {
        self.dependencies = dependencies
        self.viewController = viewController
    }
}

extension LoginRouter: LoginRouterProtocol {
	func navigate(toRoute route: LoginRoute) {
        switch route {
        case .main:
            DispatchQueue.main.async {
                let vc = MainTabBarController()
                vc.modalPresentationStyle = .overFullScreen
                self.viewController?.present(vc, animated: true, completion: nil)
            }
        case .createAnAccount:
            DispatchQueue.main.async {
                let vc = SignupWireframe.makeViewController(delegate: nil)
                self.viewController?.present(vc, animated: true, completion: nil)
            }
        }
    }

    func dismiss(animated: Bool) {
		viewController?.dismiss(animated: animated, completion: nil)
	}
}
