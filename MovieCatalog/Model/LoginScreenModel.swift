//
//  SignInScreenModel.swift
//  MovieCatalog
//
//  Created by admin on 22.01.2023.
//

import Foundation

struct LoginScreenModel {
    
    var loginText: String = ""
    var passwordText: String = ""
    var areFilledFields: Bool = false
    
    mutating func changeFieldsValues(fieldType: String, text: String) {
        switch fieldType {
        case "Логин":
            loginText = text
        case "Пароль":
            passwordText = text
        default:
            print("Nothing happened")
        }
        areFilledFields = !(loginText.isEmpty || passwordText.isEmpty)
    }
    
}
