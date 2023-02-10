//
//  SignInScreenViewModel.swift
//  MovieCatalog
//
//  Created by admin on 22.01.2023.
//

import SwiftUI

class LoginScreenViewModel: ObservableObject {
    
    @Published private var model: LoginScreenModel = LoginScreenModel()
    
    var isPresenting: Bool {
        get {
            model.isPresenting
        }
        set(newValue) {
            model.isPresenting = newValue
        }
    }
    
    var errorToastMessage: String {
        get {
            model.errorToastMessage
        }
        set (newValue) {
            model.errorToastMessage = newValue
        }
        
    }
    
    var isPressedButton: Bool {
        get {
            model.isPressedButton
        }
        set (newValue) {
            model.isPressedButton = newValue
        }
    }
    
    var loginText: String {
        get {
            model.loginText
        }
        set (newValue) {
            model.loginText = newValue
        }
    }
    var passwordText: String {
        get {
            model.passwordText
        }
        set (newValue) {
            model.passwordText = newValue
        }
    }
    
    var areFilledFields: Bool {
        get {
            areFilled()
        }
        set (newValue) {
            model.areFilledFields = newValue
        }
    }
    
    func areFilled() -> Bool {
        return !(loginText.isEmpty || passwordText.isEmpty)
    }
    
//    func changeFieldsValues(fieldType: String, newValue: String) {
//        model.changeFieldsValues(fieldType: fieldType, text: newValue)
//    }
    
}
