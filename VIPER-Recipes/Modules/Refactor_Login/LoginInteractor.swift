//
//  LoginInteractor.swift
//  VIPER-Recipes
//
//  Created admin on 25.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {

}

final class LoginInteractor {
    private let dependencies: LoginInteractorDependenciesProtocol
    
    init(dependencies: LoginInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}

extension LoginInteractor: LoginInteractorProtocol {
	
}
