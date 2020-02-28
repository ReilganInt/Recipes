//
//  SavesPresenter.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SavesPresenterProtocol: class {
    func didReceiveEvent(_ event: SavesEvent)
    func didTriggerAction(_ action: SavesAction)
}

final class SavesPresenter {
    private let dependencies: SavesPresenterDependenciesProtocol
    private weak var view: (SavesViewProtocol & UIViewController)?
    private let interactor: SavesInteractorProtocol
    private let router: SavesRouterProtocol
    private weak var delegate: SavesDelegateProtocol?
    
    init(dependencies: SavesPresenterDependenciesProtocol, 
         view: (SavesViewProtocol & UIViewController), 
         interactor: SavesInteractorProtocol, 
         router: SavesRouterProtocol, 
         delegate: SavesDelegateProtocol?) {
        self.dependencies = dependencies
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
}

extension SavesPresenter: SavesPresenterProtocol {
    func didReceiveEvent(_ event: SavesEvent) {
        switch event {
            case .viewDidLoad:
                debugPrint("viewDidLoad")
        }
    }

    func didTriggerAction(_ action: SavesAction) {
        switch action {
            default: ()
        }
    }
}
