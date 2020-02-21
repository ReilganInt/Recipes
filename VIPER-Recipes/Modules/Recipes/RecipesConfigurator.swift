//
//  RecipesConfigurator.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RecipesConfigurator {

   static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = RecipesViewController(nibName: nil, bundle: nil)
        let interactor = RecipesInteractor()
        let router = RecipesRouter()
        let presenter = RecipesPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}