//
//  SignInScreenViewModel.swift
//  MovieCatalog
//
//  Created by admin on 22.01.2023.
//

import SwiftUI

class LoginScreenViewModel: ObservableObject {
    
    @Published private var model: LoginScreenModel = LoginScreenModel()
    
    var pressedSignInButton: Bool {
        get {
            model.pressedSignInButton
        }
        set (newValue) {
            model.pressedSignInButton.toggle()
        }
    }
    
    var loginText: String {
        get {
            model.loginText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "Логин", newValue: newValue)
        }
    }
    var passwordText: String {
        get {
            model.passwordText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "Пароль", newValue: newValue)
        }
    }
    
    var areFilledFields: Bool {
        get {
            model.areFilledFields
        }
        set (newValue) {
            model.areFilledFields = newValue
        }
    }
    
    func changeFieldsValues(fieldType: String, newValue: String) {
        model.changeFieldsValues(fieldType: fieldType, text: newValue)
    }
    
}
