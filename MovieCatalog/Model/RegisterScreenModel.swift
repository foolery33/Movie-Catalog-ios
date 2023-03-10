//
//  RegisterScreenModel.swift
//  MovieCatalog
//
//  Created by admin on 24.01.2023.
//

import Foundation

struct RegisterScreenModel {
    
    var loginText: String = ""
    var emailText: String = ""
    var nameText: String = ""
    var passwordText: String = ""
    var confirmPasswordText: String = ""
    var birthDateText: String = ""
    var birthDateValue: Date = Date.now
    var sexText: String = ""
    var areFilledFields: Bool = false
    
    mutating func changeFieldsValues(fieldType: String, text: String) {
        switch fieldType {
        case "Логин":
            loginText = text
        case "E-mail":
            emailText = text
        case "Имя":
            nameText = text
        case "Пароль":
            passwordText = text
        case "Подтвердите пароль":
            confirmPasswordText = text
        case "Дата рождения":
            birthDateText = text
        case "Мужчина":
            sexText = "male"
        case "Женщина":
            sexText = "female"
        default:
            print("Nothing happened")
        }
        areFilledFields = !(loginText.isEmpty || emailText.isEmpty || nameText.isEmpty || passwordText.isEmpty || confirmPasswordText.isEmpty || birthDateText.isEmpty || sexText.isEmpty)
    }
    
}
