//
//  ProfileScreen.swift
//  MovieCatalog
//
//  Created by admin on 03.02.2023.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var viewModel: ProfileScreenViewModel
    
    var userName: String = "Ulyana"
    
    @State var emailText: String = "test@example.com"
    @State var avatarLinkText: String = "https://vk.cc/chdMpX"
    @State var usernameText: String = "Тест Тестович"
    @State var birthDateText: String = "01.01.2022"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(spacing: 16) {
                    Image("Ulya")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 88, height: 88)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    Text(userName)
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                Spacer().frame(height: 32)
                VStack(spacing: 16) {
                    VStack(spacing: 8) {
                        Text("E-mail")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.strokeColor)
                            .font(.system(size: 16, weight: .medium))
                        OutlinedTextFieldView(writtenText: $viewModel.emailText, placeholderText: "")
                    }
                    VStack(spacing: 8) {
                        Text("Cсылка на аватарку")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.strokeColor)
                            .font(.system(size: 16, weight: .medium))
                        OutlinedTextFieldView(writtenText: $viewModel.avatarLinkText, placeholderText: "")
                    }
                    VStack(spacing: 8) {
                        Text("Имя")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.strokeColor)
                            .font(.system(size: 16, weight: .medium))
                        OutlinedTextFieldView(writtenText: $viewModel.nameText, placeholderText: "")
                    }
                    VStack(spacing: 8) {
                        Text("Дата рождения")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.strokeColor)
                            .font(.system(size: 16, weight: .medium))
                        DatePickerView(dateValue: $viewModel.birthDateValue, dateText: $viewModel.birthDateText, placeholderText: "")
                    }
                    VStack(spacing: 8) {
                        Text("Пол")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.strokeColor)
                            .font(.system(size: 16, weight: .medium))
                        SexButton(sexText: $viewModel.sexText)
                    }
                    
                }
                Spacer().frame(height: 48)
                VStack(spacing: 8) {
                    OutlinedButtonView(areFilledFields: $viewModel.areFilledFields, text: "Сохранить", action: {})
                    BasicButtonView(text: "Выйти из аккаунта", action: {})
                }
            }
            .padding(16)
        }
        .preferredColorScheme(.dark)
        .background(Color.backgroundColor)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen(viewModel: ProfileScreenViewModel())
    }
}