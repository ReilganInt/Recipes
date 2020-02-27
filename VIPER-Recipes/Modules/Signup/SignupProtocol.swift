//
//  SignupProtocol.swift
//  VIPER-Recipes
//
//  Created admin on 27.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

protocol SignupProtocol: class {
    func getEmailTextField() -> UITextField
    func getPasswordtextField() -> UITextField
    func getConfirmPasswordtextField() -> UITextField
}
