//
//  SavesRouter.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SavesRouterProtocol {
    func navigate(toRoute route: SavesRoute)
    func dismiss(animated: Bool)
}

final class SavesRouter {
    private let dependencies: SavesRouterDependenciesProtocol
    private weak var viewController: UIViewController?

    init(dependencies: SavesRouterDependenciesProtocol,
    	 viewController: UIViewController?) {
        self.dependencies = dependencies
        self.viewController = viewController
    }
}

extension SavesRouter: SavesRouterProtocol {
	func navigate(toRoute route: SavesRoute) {
        switch route {
            default: ()
        }
    }

    func dismiss(animated: Bool) {
		viewController?.dismiss(animated: animated, completion: nil)
	}
}
