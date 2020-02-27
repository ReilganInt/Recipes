//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Sebastian Boldt @SebastianBoldt
//  and Christian Elies @crelies
//  http://sebastianboldt.com https://www.christianelies.de
//

import UIKit

protocol ___VARIABLE_MODULENAME___WireframeProtocol {
    static func makeViewController(delegate: ___VARIABLE_MODULENAME___DelegateProtocol?) throws -> ___VARIABLE_MODULENAME___ViewController
}

struct ___VARIABLE_MODULENAME___Wireframe: ___VARIABLE_MODULENAME___WireframeProtocol {
    static func makeViewController(delegate: ___VARIABLE_MODULENAME___DelegateProtocol?) throws -> ___VARIABLE_MODULENAME___ViewController {
        guard let viewController = UIStoryboard(name: "___VARIABLE_MODULENAME___", bundle: nil).instantiateInitialViewController() as? ___VARIABLE_MODULENAME___ViewController else {
            throw ___VARIABLE_MODULENAME___WireframeError.couldNotInstantiate___VARIABLE_MODULENAME___ViewController
        }

        let routerDependencies = ___VARIABLE_MODULENAME___RouterDependencies()
        let router = ___VARIABLE_MODULENAME___Router(dependencies: routerDependencies, viewController: viewController)

        let interactorDependencies = ___VARIABLE_MODULENAME___InteractorDependencies()
        let presenterDependencies = ___VARIABLE_MODULENAME___PresenterDependencies()

        let interactor = ___VARIABLE_MODULENAME___Interactor(dependencies: interactorDependencies)
        let presenter = ___VARIABLE_MODULENAME___Presenter(dependencies: presenterDependencies, view: viewController, interactor: interactor, router: router, delegate: delegate)
        viewController.setPresenter(presenter)
        
        return viewController
    }
}
