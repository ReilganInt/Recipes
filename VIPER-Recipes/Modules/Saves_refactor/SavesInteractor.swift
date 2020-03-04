//
//  SavesInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SavesInteractorProtocol {
    func getAllRecipes(comletionHandler: @escaping (Result<[Recipe], Error>) -> ())
}

final class SavesInteractor {
    private let dependencies: SavesInteractorDependenciesProtocol
    
    init(dependencies: SavesInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension SavesInteractor: SavesInteractorProtocol {
    func getAllRecipes(comletionHandler: @escaping (Result<[Recipe], Error>) -> ()) {
        DataCoordinator.getAllRecipes() { result in
            switch result {
            case .failure(let error):
                comletionHandler(.failure(error))
            case .success(let recipes):
                comletionHandler(.success(recipes))
            }
        }
    }
    

    
	
}
