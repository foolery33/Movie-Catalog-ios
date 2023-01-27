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
            changeFieldsValues(fieldType: "Дата рождения", newValue: convertDate(date: newValue))
        }
    }
    
    var birthDateText: String {
        get {
            model.birthDateText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "Дата рождения", newValue: newValue)
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
    
    var emailText: String {
        get {
            model.emailText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "E-mail", newValue: newValue)
        }
    }
    
    var nameText: String {
        get {
            model.nameText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "Имя", newValue: newValue)
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
    
    var confirmPasswordText: String {
        get {
            model.confirmPasswordText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "Подтвердите пароль", newValue: newValue)
        }
    }
    
    var sexText: String {
        get {
            model.sexText
        }
        set (newValue) {
            setSex(gender: newValue)
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
    
    func changeFieldsValues(fieldType: String, newValue: String) -> Void {
        model.changeFieldsValues(fieldType: fieldType, text: newValue)
    }
    
    func setSex(gender: String) -> Void {
        changeFieldsValues(fieldType: gender, newValue: "blahblahblah")
    }

    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter.string(from: date)
    }
    
}
