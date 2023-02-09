//
//  LoginScreen.swift
//  MovieCatalog
//
//  Created by admin on 20.01.2023.
//

import SwiftUI
import AlertToast

struct LoginScreen: View {
    
    @EnvironmentObject var viewModel: GeneralViewModel
    
    var body: some View {
        ZStack {
            VStack {
                ZStack(alignment: .top) {
                    VStack {
                        Image("Logo").padding(.top, 32)
                        Spacer().frame(height: 64)
                        OutlinedTextFieldView(writtenText: $viewModel.loginScreenVM.loginText, placeholderText: "Логин", isNecessary: false)
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.loginScreenVM.passwordText, placeholderText: "Пароль", isNecessary: false)
                        
                    }.padding([.leading, .trailing], 16)
                }
                Spacer()
                VStack(spacing: 8) {
                    
                    NavigationLink(destination: MainScreen(), isActive: $viewModel.loginScreenVM.pressedSignInButton) {
                        EmptyView()
                    }
                    OutlinedButtonView(areFilledFields: $viewModel.loginScreenVM.areFilledFields, text: "Войти") {
                        viewModel.authVM.login(
                            userName: viewModel.loginScreenVM.loginText,
                            password: viewModel.loginScreenVM.passwordText,
                            isPressedButton: $viewModel.loginScreenVM.pressedSignInButton) { response in
                                
                                switch(response) {
                                case 200:
                                    print(viewModel.loginScreenVM.pressedSignInButton)
                                case 400:
                                    viewModel.loginScreenVM.errorToastMessage = "Incorrect login or password"
                                    viewModel.isShowingToast.toggle()
                                default:
                                    viewModel.loginScreenVM.errorToastMessage = "Some unexpected error. Please contact developer"
                                    viewModel.isShowingToast.toggle()
                                }
                                
                            }
                        
                    }
                    .toast(isPresenting: $viewModel.isShowingToast) {
                        AlertToast(type: .regular, title: viewModel.loginScreenVM.errorToastMessage)
                    }
                    NavigationLink(destination: RegisterScreen()) {
                        BasicButtonView(text: "Регистрация")
                    }
                }.padding([.leading, .trailing], 16)
                    .padding(.bottom, 4)
            }
        }
        .preferredColorScheme(.dark)
        .background(Color.backgroundColor)
        .onAppear {
            viewModel.isShowingToast = false
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginScreen()
        }
        .environmentObject(GeneralViewModel())
    }
}
