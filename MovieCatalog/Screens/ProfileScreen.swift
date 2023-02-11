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
    
    @State var itemPressed: Int = 1
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack(spacing: 16) {
                        AsyncImage(url: URL(string: viewModel.profileScreenVM.avatarLinkText)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 88, height: 88)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 88, height: 88)
                        .clipShape(Circle())

//                        Image("Ulya")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 88, height: 88)
//                            .aspectRatio(contentMode: .fit)
//                            .clipShape(Circle())
                        Text(viewModel.profileScreenVM.nickName)
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
                            DatePickerView(dateValue: $viewModel.profileScreenVM.birthDateValue, dateText: $viewModel.profileScreenVM.birthDateText, placeholderText: "", isNecessary: true)
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
                        OutlinedButtonView(areFilledFields: $viewModel.profileScreenVM.areFilledFields, text: "Сохранить") {
                            viewModel.userVM.putProfile(viewModel: $viewModel.profileScreenVM) { response in
                                print(response)
                                switch (response) {
                                case 200:
                                    viewModel.toastMessage = "Данные успешно сохранены"
                                    viewModel.profileScreenVM.birthDateValue = viewModel.profileScreenVM.convertStringIntoDate(stringDate: viewModel.profileScreenVM.birthDateText)
                                    break
                                case 401:
                                    viewModel.toastMessage = "Your token is expired. Please authenticate your account again"
                                case 400:
                                    viewModel.toastMessage = "Some error"
                                default:
                                    viewModel.toastMessage = "Some unexpected error. Please contact"
                                }
                                viewModel.isShowingToast = true
                            }
                        }
                        Text("Выйти из аккаунта")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.redColor)
                            .font(.system(size: 16, weight: .medium))
                            .padding([.top, .bottom], 6)
                            .onTapGesture {
                                viewModel.authVM.logout(isPressedButton: $viewModel.profileScreenVM.isPressedButton) { response in
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
                        NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true), isActive: $viewModel.profileScreenVM.isPressedButton) {
                            EmptyView()
                        }
                        NavigationLink(destination: LoginScreen().navigationBarBackButtonHidden(true), isActive: $viewModel.isExpiredToken, label: {EmptyView()})
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
            DispatchQueue.main.async {
                viewModel.userVM.getProfile(viewModel: $viewModel) { response in
                    switch (response) {
                    case 200:
                        print(viewModel.profileScreenVM.birthDateText)
                        print(viewModel.profileScreenVM.birthDateValue)
                    case 401:
                        viewModel.toastMessage = "Your login is expired. Please reload this page to fix it"
                        viewModel.isShowingToast = true
                    default:
                        print("Failed")
                    }
                }
            }
        }
        .toast(isPresenting: $viewModel.isShowingToast) {
            AlertToast(type: .regular, title: "Profile Screen message", subTitle: viewModel.toastMessage)
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
