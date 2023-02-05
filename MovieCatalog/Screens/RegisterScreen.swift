import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var viewModel: RegisterScreenViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.backgroundColor.frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(spacing: 0) {
                Image("Logo").resizable().scaledToFit().frame(width: 147).padding(.top, 32)
                Spacer().frame(height: 24)
                SectionText(text: "Регистрация")
                ScrollView(showsIndicators: false) {
                    Spacer().frame(height: 16)
                    Group {
                        OutlinedTextFieldView(writtenText: $viewModel.loginText, placeholderText: "Логин")
                        Spacer().frame(height: 16)
                        OutlinedTextFieldView(writtenText: $viewModel.emailText, placeholderText: "E-mail")
                        Spacer().frame(height: 16)
                        OutlinedTextFieldView(writtenText: $viewModel.nameText, placeholderText: "Имя")
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.passwordText, placeholderText: "Пароль")
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.confirmPasswordText, placeholderText: "Подтвердите пароль")
                    }
                    Group {
                        Spacer().frame(height: 16)
                        DatePickerView(dateValue: $viewModel.birthDateValue, dateText: $viewModel.birthDateText, placeholderText: "Дата рождения")
                        Spacer().frame(height: 16)
                        SexButton(sexText: $viewModel.sexText)
                        Spacer().frame(height: 43)
                    }
                    OutlinedButtonView(areFilledFields: $viewModel.areFilledFields, text: "Зарегистрироваться") {}
                    Spacer().frame(height: 8)
                    BasicButtonView(text: "У меня уже есть аккаунт") {}
                    Spacer().frame(height: 6)
                }
                Spacer()
            }.frame(maxWidth: .infinity).padding([.leading, .trailing], 16)
        }
        .preferredColorScheme(.dark)
        .background(Color.backgroundColor)
    }
    
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen(viewModel: RegisterScreenViewModel())
    }
}
