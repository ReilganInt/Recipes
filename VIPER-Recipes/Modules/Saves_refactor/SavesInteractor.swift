//
//  SavesInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 28.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol SavesInteractorProtocol {

}

final class SavesInteractor {
    private let dependencies: SavesInteractorDependenciesProtocol
    
    init(dependencies: SavesInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension SavesInteractor: SavesInteractorProtocol {
	
}
