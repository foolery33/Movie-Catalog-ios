import SwiftUI

class ProfileScreenViewModel: ObservableObject {
    
    @Published private var model: ProfileScreenModel = ProfileScreenModel()
    
    var birthDateValue: Date {
        get {
            model.birthDateValue
        }
        set (newValue) {
            model.birthDateValue = newValue
            changeFieldsValues(fieldType: "Дата рождения", newValue: convertDate(date: newValue))
        }
    }
    
    var birthDateText: String? {
        get {
            model.birthDateText
        }
        set (newValue) {
            model.birthDateText = newValue
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
    
    var avatarLinkText: String {
        get {
            model.avatarLinkText
        }
        set (newValue) {
            changeFieldsValues(fieldType: "Ссылка на аватарку", newValue: newValue)
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
    
    var sexText: Int? {
        get {
            model.sexText
        }
        set (newValue) {
            sexText = newValue
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
    
    func convertStringIntoDate(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter.date(from: stringDate) ?? Date.now
    }
    
}
