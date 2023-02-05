import Foundation

struct ProfileScreenModel {
    
    var emailText: String = "test@examale.com"
    var avatarLinkText: String = "https://vk.cc/chdMpX"
    var nameText: String = "Тест тестович"
    var birthDateText: String = "01.01.2022"
    var birthDateValue: Date = Date.now
    var sexText: String = "female"
    var areFilledFields: Bool = true
    
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
        case "Мужчина":
            sexText = "male"
        case "Женщина":
            sexText = "female"
        default:
            print("Nothing happened")
        }
        areFilledFields = !(emailText.isEmpty || avatarLinkText.isEmpty || nameText.isEmpty || birthDateText.isEmpty || sexText.isEmpty)
    }
    
    func convertStringIntoDate(stringDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"
        return dateFormatter.date(from: stringDate)!
    }
    
}
