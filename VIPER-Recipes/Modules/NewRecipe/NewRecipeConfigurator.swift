//
//  NewRecipeConfigurator.swift
//  VIPER-Recipes
//
//  Created admin on 19.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class NewRecipeConfigurator {

   static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = NewRecipeViewController(nibName: nil, bundle: nil)
        let interactor = NewRecipeInteractor()
        let router = NewRecipeRouter()
        let presenter = NewRecipePresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}