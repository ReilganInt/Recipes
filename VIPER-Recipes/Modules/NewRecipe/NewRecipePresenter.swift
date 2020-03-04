//
//  NewRecipePresenter.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol NewRecipePresenterProtocol: class {
    func didReceiveEvent(_ event: NewRecipeEvent)
    func didTriggerAction(_ action: NewRecipeAction)
}

final class NewRecipePresenter {
    private let dependencies: NewRecipePresenterDependenciesProtocol
    private weak var view: (NewRecipeViewProtocol & UIViewController)?
    private let interactor: NewRecipeInteractorProtocol
    private let router: NewRecipeRouterProtocol
    private weak var delegate: NewRecipeDelegateProtocol?
    
    init(dependencies: NewRecipePresenterDependenciesProtocol, 
         view: (NewRecipeViewProtocol & UIViewController), 
         interactor: NewRecipeInteractorProtocol, 
         router: NewRecipeRouterProtocol, 
         delegate: NewRecipeDelegateProtocol?) {
        self.dependencies = dependencies
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegate = delegate
    }
}

extension NewRecipePresenter: NewRecipePresenterProtocol {
    func didReceiveEvent(_ event: NewRecipeEvent) {
        switch event {
            case .viewDidLoad:
                debugPrint("viewDidLoad")
        }
    }

    func didTriggerAction(_ action: NewRecipeAction) {
        switch action {
        case .didSave:
            guard let name = view?.getName() else { return
                // throw
            }
            guard let imageData = view?.getImageData() else { return
                // throw
            }
            interactor.save(name: name, imageData: imageData, completion: { result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(_):
                    DispatchQueue.main.async {
                        self.delegate?.reloadData()
                        self.router.dismiss(animated: true)
                    }
                }
            })
        case .dismiss:
            router.dismiss(animated: true)
        }
    }
}
