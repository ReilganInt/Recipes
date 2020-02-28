//
//  NewRecipeInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol NewRecipeInteractorProtocol {

}

final class NewRecipeInteractor {
    private let dependencies: NewRecipeInteractorDependenciesProtocol
    
    init(dependencies: NewRecipeInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension NewRecipeInteractor: NewRecipeInteractorProtocol {
	
}
