//
//  ProfileScreen.swift
//  MovieCatalog
//
//  Created by admin on 03.02.2023.
//

import SwiftUI
import AlertToast

struct ProfileScreen: View {
    
    @EnvironmentObject var viewModel: GeneralViewModel
    
    var userName: String = "Ulyana"
    
    @State var itemPressed: Int = 1
    @State var emailText: String = "test@example.com"
    @State var avatarLinkText: String = "https://vk.cc/chdMpX"
    @State var usernameText: String = "Тест Тестович"
    @State var birthDateText: String = "01.01.2022"
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                            OutlinedTextFieldView(writtenText: $viewModel.profileScreenVM.emailText, placeholderText: "", isNecessary: true)
                        }
                        VStack(spacing: 8) {
                            Text("Cсылка на аватарку")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.strokeColor)
                                .font(.system(size: 16, weight: .medium))
                            OutlinedTextFieldView(writtenText: $viewModel.profileScreenVM.avatarLinkText, placeholderText: "", isNecessary: false)
                        }
                        VStack(spacing: 8) {
                            Text("Имя")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.strokeColor)
                                .font(.system(size: 16, weight: .medium))
                            OutlinedTextFieldView(writtenText: $viewModel.profileScreenVM.nameText, placeholderText: "", isNecessary: true)
                        }
                        VStack(spacing: 8) {
                            Text("Дата рождения")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.strokeColor)
                                .font(.system(size: 16, weight: .medium))
                            DatePickerView(dateValue: $viewModel.profileScreenVM.birthDateValue, dateText: $viewModel.profileScreenVM.birthDateText, placeholderText: "", isNecessary: false)
                        }
                        VStack(spacing: 8) {
                            Text("Пол")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.strokeColor)
                                .font(.system(size: 16, weight: .medium))
                            SexButton(sexText: $viewModel.profileScreenVM.sexText)
                        }
                        
                    }
                    Spacer().frame(height: 48)
                    VStack(spacing: 8) {
                        OutlinedButtonView(areFilledFields: $viewModel.profileScreenVM.areFilledFields, text: "Сохранить") {}
                        NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true), isActive: $viewModel.profileScreenVM.isPressedButton) {
                            EmptyView()
                        }
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                        Text("Выйти из аккаунта")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.redColor)
                            .font(.system(size: 16, weight: .medium))
                            .padding([.top, .bottom], 6)
                            .onTapGesture {
                                viewModel.authVM.logout(isPressedButton: $viewModel.profileScreenVM.isPressedButton) { response in
                                    print(response)
                                    switch(response) {
                                    case 200:
                                        print("Successful logging out")
                                        viewModel.loginScreenVM = LoginScreenViewModel()
                                        viewModel.registerScreenVM = RegisterScreenViewModel()
                                        break
                                    default:
                                        viewModel.toastMessage = "Some unexpected error. Please contact developer"
                                        viewModel.isShowingToast.toggle()
                                    }
                                }
                            }
                            .toast(isPresenting: $viewModel.isShowingToast) {
                                AlertToast(type: .regular, title: "Logout error", subTitle: viewModel.toastMessage)
                            }
                    }
                    Spacer().frame(height: 85)
                }
                .padding(16)
            }
            .preferredColorScheme(.dark)
            .background(Color.backgroundColor)
            BottomBar(itemPressed: $itemPressed)
                
        }
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileScreen()
        }
        .environmentObject(GeneralViewModel())
    }
}
