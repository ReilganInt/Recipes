//
//  GroceryPresenter.swift
//  VIPER-Recipes
//
//  Created admin on 18.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class GroceryPresenter: GroceryPresenterProtocol, GroceryInteractorOutputProtocol {

    weak private var view: GroceryViewProtocol?
    var interactor: GroceryInteractorInputProtocol?
    private let router: GroceryWireframeProtocol

    init(interface: GroceryViewProtocol, interactor: GroceryInteractorInputProtocol?, router: GroceryWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
