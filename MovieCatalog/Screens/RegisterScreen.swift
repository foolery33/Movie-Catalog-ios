import SwiftUI

struct RegisterScreen: View {
    
    @EnvironmentObject var viewModel: GeneralViewModel
    
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
                        OutlinedTextFieldView(writtenText: $viewModel.registerScreenVM.loginText, placeholderText: "Логин")
                        Spacer().frame(height: 16)
                        OutlinedTextFieldView(writtenText: $viewModel.registerScreenVM.emailText, placeholderText: "E-mail")
                        Spacer().frame(height: 16)
                        OutlinedTextFieldView(writtenText: $viewModel.registerScreenVM.nameText, placeholderText: "Имя")
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.registerScreenVM.passwordText, placeholderText: "Пароль")
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.registerScreenVM.confirmPasswordText, placeholderText: "Подтвердите пароль")
                    }
                    Group {
                        Spacer().frame(height: 16)
                        DatePickerView(dateValue: $viewModel.registerScreenVM.birthDateValue, dateText: $viewModel.registerScreenVM.birthDateText, placeholderText: "Дата рождения")
                        Spacer().frame(height: 16)
                        SexButton(sexText: $viewModel.registerScreenVM.sexText)
                        Spacer().frame(height: 43)
                    }
                    NavigationLink(destination: MainScreen()) {
                        OutlinedButtonView(areFilledFields: $viewModel.registerScreenVM.areFilledFields, text: "Зарегистрироваться"){}
                    }
                    .navigationBarBackButtonHidden(true)
                    Spacer().frame(height: 8)
                    NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true)) {
                        BasicButtonView(text: "У меня уже есть аккаунт")
                    }
                    .environmentObject(viewModel)
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
        NavigationView {
            RegisterScreen()
        }
        .environmentObject(GeneralViewModel())
    }
}
