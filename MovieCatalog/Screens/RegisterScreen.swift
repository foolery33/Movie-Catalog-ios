import SwiftUI
import AlertToast

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
                        OutlinedTextFieldView(writtenText: $viewModel.registerScreenVM.loginText, placeholderText: "Логин", isNecessary: true)
                        Spacer().frame(height: 16)
                        OutlinedTextFieldView(writtenText: $viewModel.registerScreenVM.emailText, placeholderText: "E-mail", isNecessary: true)
                        Spacer().frame(height: 16)
                        OutlinedTextFieldView(writtenText: $viewModel.registerScreenVM.nameText, placeholderText: "Имя", isNecessary: true)
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.registerScreenVM.passwordText, placeholderText: "Пароль", isNecessary: true)
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.registerScreenVM.confirmPasswordText, placeholderText: "Подтвердите пароль", isNecessary: true)
                    }
                    Group {
                        Spacer().frame(height: 16)
                        DatePickerView(dateValue: $viewModel.registerScreenVM.birthDateValue, dateText: $viewModel.registerScreenVM.birthDateText, placeholderText: "Дата рождения", isNecessary: false)
                        Spacer().frame(height: 16)
                        SexButton(sexText: $viewModel.registerScreenVM.sexText)
                        Spacer().frame(height: 43)
                    }
                    
                    NavigationLink(destination: MainScreen(), isActive: $viewModel.registerScreenVM.isPressedButton) {
                        EmptyView()
                    }
                    .navigationBarBackButtonHidden(true)
                    OutlinedButtonView(areFilledFields: $viewModel.registerScreenVM.areFilledFields, text: "Зарегистрироваться") {
                        if let message = viewModel.registerScreenVM.showRegistrationDataErrors() {
                            viewModel.toastMessage = message
                            viewModel.isShowingToast = true
                        }
                        else {
                            viewModel.authVM.register(
                                userName: viewModel.registerScreenVM.loginText,
                                name: viewModel.registerScreenVM.nameText,
                                password: viewModel.registerScreenVM.passwordText,
                                email: viewModel.registerScreenVM.emailText,
                                birthDate: viewModel.registerScreenVM.birthDateText,
                                gender: viewModel.registerScreenVM.sexText,
                                isPressedButton: $viewModel.registerScreenVM.isPressedButton) { response in
                                    
                                    switch(response) {
                                    case 200:
                                        break
                                    case 400:
                                        viewModel.toastMessage = "Username '\(viewModel.registerScreenVM.loginText)' is already taken"
                                        viewModel.isShowingToast = true
                                    default:
                                        viewModel.toastMessage = "Some unexpected error. Please contact developer"
                                        viewModel.isShowingToast = true
                                    }
                                    
                                }
                        }
                    }
                    .toast(isPresenting: $viewModel.isShowingToast) {
                        AlertToast(type: .regular, title: "Registration error", subTitle: viewModel.toastMessage)
                    }
                    Spacer().frame(height: 8)
                    NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true)) {
                        BasicButtonView(text: "У меня уже есть аккаунт")
                    }
                    Spacer().frame(height: 6)
                }
                Spacer()
            }.frame(maxWidth: .infinity).padding([.leading, .trailing], 16)
        }
        .preferredColorScheme(.dark)
        .background(Color.backgroundColor)
        .onAppear {
            viewModel.isShowingToast = false
        }
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
