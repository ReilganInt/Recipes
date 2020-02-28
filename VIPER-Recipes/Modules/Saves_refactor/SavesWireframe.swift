//
//  SavesWireframe.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SavesWireframeProtocol {
    static func makeViewController(delegate: SavesDelegateProtocol?) -> (UIViewController & SavesProtocol)
}

struct SavesWireframe: SavesWireframeProtocol {
    static func makeViewController(delegate: SavesDelegateProtocol?) -> (UIViewController & SavesProtocol) {
        let flowLayout = UICollectionViewFlowLayout()
        let viewController = SavesViewController(collectionViewLayout: flowLayout)

        let routerDependencies = SavesRouterDependencies()
        let router = SavesRouter(dependencies: routerDependencies, viewController: viewController)

        let interactorDependencies = SavesInteractorDependencies()
        let presenterDependencies = SavesPresenterDependencies()

        let interactor = SavesInteractor(dependencies: interactorDependencies)
        let presenter = SavesPresenter(dependencies: presenterDependencies, view: viewController, interactor: interactor, router: router, delegate: delegate)
        viewController.setPresenter(presenter)
        
        return viewController
    }
}
