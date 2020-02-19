//
//  SavesConfigurator.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SavesConfigurator {

   static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
    let layout = UICollectionViewFlowLayout()
    layout.collectionView?.register(SavesLocalCell.self, forCellWithReuseIdentifier: SavesLocalCell.id)
    layout.scrollDirection = .vertical
    layout.register(SavesLocalCell.self, forDecorationViewOfKind: SavesLocalCell.id)
        let view = SavesViewController(collectionViewLayout: layout)
        let interactor = SavesInteractor()
        let router = SavesRouter()
        let presenter = SavesPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
