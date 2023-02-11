//
//  RegisterScreenViewModel.swift
//  MovieCatalog
//
//  Created by admin on 24.01.2023.
//

import SwiftUI

class RegisterScreenViewModel: ObservableObject {
    
    @Published private var model: RegisterScreenModel = RegisterScreenModel()
    
    var birthDateValue: Date {
        get {
            model.birthDateValue
        }
        set (newValue) {
            model.birthDateValue = newValue
            model.birthDateText = convertDate(date: newValue)
        }
    }
    
    var birthDateText: String {
        get {
            model.birthDateText
        }
        set (newValue) {
            model.birthDateText = newValue
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
    
    var emailText: String {
        get {
            model.emailText
        }
        set (newValue) {
            model.emailText = newValue
        }
    }
    
    var nameText: String {
        get {
            model.nameText
        }
        set (newValue) {
            model.nameText = newValue
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
    
    var confirmPasswordText: String {
        get {
            model.confirmPasswordText
        }
        set (newValue) {
            model.confirmPasswordText = newValue
        }
    }
    
    var sexText: Int? {
        get {
            model.sexText
        }
        set (newValue) {
            model.sexText = newValue
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
    
    var isPressedButton: Bool {
        get {
            model.isPressedButton
        }
        set (newValue) {
            model.isPressedButton = newValue
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
    
    func areFilled() -> Bool {
        return !(loginText.isEmpty || nameText.isEmpty || passwordText.isEmpty || confirmPasswordText.isEmpty || emailText.isEmpty)
    }
//    func changeFieldsValues(fieldType: String, newValue: String) -> Void {
//        model.changeFieldsValues(fieldType: fieldType, text: newValue)
//    }
    
//    func setSex(gender: String) -> Void {
//        changeFieldsValues(fieldType: gender, newValue: "blahblahblah")
//    }

    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter.string(from: date)
    }
    
    func showRegistrationDataErrors() -> String? {
        if( model.loginText.contains(" ")) {
            return "Login should not contain any whitespaces"
        }
        if (model.passwordText.count < 6) {
            return "Password should consist of at least 6 characters"
        }
        if(model.passwordText != model.confirmPasswordText) {
            return "Written passwords are different"
        }
        if (!isValidEmail(model.emailText)) {
            return "Your e-mail does not conform to e-mail starndard"
        }
        return nil
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
