//
//  GroceryConfigurator.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class GroceryConfigurator {

   static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = GroceryViewController(nibName: nil, bundle: nil)
        let interactor = GroceryInteractor()
        let router = GroceryRouter()
        let presenter = GroceryPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}