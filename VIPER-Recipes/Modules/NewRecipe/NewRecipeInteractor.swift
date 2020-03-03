//
//  NewRecipeInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol NewRecipeInteractorProtocol {
    func save(name: String, imageData: Data, completion: @escaping (Result<Void, Error>) -> ())
}

final class NewRecipeInteractor {
    private let dependencies: NewRecipeInteractorDependenciesProtocol
    
    init(dependencies: NewRecipeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension NewRecipeInteractor: NewRecipeInteractorProtocol {
    func save(name: String, imageData: Data, completion: @escaping (Result<Void, Error>) -> ()) {
        DataCoordinator.performBackgroundTask { (context) -> (Void) in
            let obj = Recipe(context: context)
            obj.name = name
            obj.image = imageData
            obj.stars = Int32.random(in: 0..<5)
            do {
                if context.hasChanges {
                    try context.save()
                    completion(.success(()))
                }
            } catch {
                // Error handler
                print("exception saving in background thread")
                completion(.failure(error))
            }
        }
    }
    
	
}
