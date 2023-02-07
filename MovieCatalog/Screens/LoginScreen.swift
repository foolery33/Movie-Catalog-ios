//
//  LoginScreen.swift
//  MovieCatalog
//
//  Created by admin on 20.01.2023.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var viewModel: LoginScreenViewModel

    var body: some View {
        ZStack {
            VStack {
                ZStack(alignment: .top) {
                    VStack {
                        Image("Logo").padding(.top, 32)
                        Spacer().frame(height: 64)
                        OutlinedTextFieldView(writtenText: $viewModel.loginText, placeholderText: "Логин")
                        Spacer().frame(height: 16)
                        SecureFieldView(writtenText: $viewModel.passwordText, placeholderText: "Пароль")
                        
                    }.padding([.leading, .trailing], 16)
                }
                Spacer()
                VStack(spacing: 8) {
                    NavigationLink(destination: MainScreen()) {
                        OutlinedButtonView(areFilledFields: $viewModel.areFilledFields, text: "Войти")
                    }
                    NavigationLink(destination: RegisterScreen(viewModel: RegisterScreenViewModel())) {
                        BasicButtonView(text: "Регистрация")
                    }
                }.padding([.leading, .trailing], 16)
                    .padding(.bottom, 4)
            }
        }
        .preferredColorScheme(.dark)
        .background(Color.backgroundColor)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen(viewModel: LoginScreenViewModel())
    }
}
