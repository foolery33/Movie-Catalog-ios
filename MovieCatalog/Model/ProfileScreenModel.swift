import Foundation

struct ProfileScreenModel {
    
    var emailText: String = "test@examale.com"
    var avatarLinkText: String = "https://vk.cc/chdMpX"
    var nameText: String = "Тест тестович"
    var birthDateText: String? = nil
    var birthDateValue: Date = Date.now
    var sexText: Int? = nil
    var areFilledFields: Bool = true
    var isPressedButton: Bool = false
    
    mutating func changeFieldsValues(fieldType: String, text: String) {
        switch fieldType {
        case "E-mail":
            emailText = text
        case "Ссылка на аватарку":
            avatarLinkText = text
        case "Имя":
            nameText = text
        case "Дата рождения":
            birthDateText = text
        default:
            print("Nothing happened")
        }
        areFilledFields = !(emailText.isEmpty || avatarLinkText.isEmpty || nameText.isEmpty || birthDateText == nil)
    }
    
    func convertStringIntoDate(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter.date(from: stringDate)!
    }
    
}
