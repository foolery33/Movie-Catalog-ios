import SwiftUI

class ProfileScreenViewModel: ObservableObject {
    
    @Published private var model: ProfileScreenModel = ProfileScreenModel()
    
    var nickName: String {
        get {
            model.nickName
        }
        set(newValue) {
            model.nickName = newValue
        }
    }
    
    var id: String {
        get {
            model.id
        }
        set (newValue) {
            model.id = newValue
        }
    }
    
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
    
    var emailText: String {
        get {
            model.emailText
        }
        set (newValue) {
            model.emailText = newValue
        }
    }
    
    var avatarLinkText: String {
        get {
            model.avatarLinkText
        }
        set (newValue) {
            model.avatarLinkText = newValue
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
    
//    func changeFieldsValues(fieldType: String, newValue: String) -> Void {
//        model.changeFieldsValues(fieldType: fieldType, text: newValue)
//    }
    
//    func setSex(gender: String) -> Void {
//        changeFieldsValues(fieldType: gender, newValue: "blahblahblah")
//    }
    
    func areFilled() -> Bool {
        return !(model.emailText.isEmpty || model.nameText.isEmpty || model.birthDateText.isEmpty)
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
