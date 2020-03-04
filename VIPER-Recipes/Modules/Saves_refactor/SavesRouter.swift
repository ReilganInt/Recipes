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
    private weak var viewController: SavesViewController?

    init(dependencies: SavesRouterDependenciesProtocol,
    	 viewController: SavesViewController?) {
        self.dependencies = dependencies
        self.viewController = viewController
    }
}

extension SavesRouter: SavesRouterProtocol {
	func navigate(toRoute route: SavesRoute) {
        switch route {
        case .newRecipe:
            let vc = NewRecipeWireframe.makeViewController(delegate: viewController)
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .overFullScreen
            viewController?.present(nc, animated: true, completion: nil)
        }
    }

    func dismiss(animated: Bool) {
		viewController?.dismiss(animated: animated, completion: nil)
	}
}
