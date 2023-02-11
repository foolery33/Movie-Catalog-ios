//
//  UserViewModel.swift
//  MovieCatalog
//
//  Created by admin on 10.02.2023.
//

import SwiftUI
import Alamofire

class UserViewModel: ObservableObject {
    
//    @Published var profileModel: ProfileModel = ProfileModel(id: "", nickName: "", email: "", avatarLink: "", name: "", birthDate: "", gender: 2)
    
    var statusCode: Int? = nil
    private let baseURL = "https://react-midterm.kreosoft.space"
    private let interceptor = CustomRequestInterceptor()
    
    func getProfile(viewModel: EnvironmentObject<GeneralViewModel>.Wrapper, completion: @escaping (Int?) -> Void) {
        let url = baseURL + "/api/account/profile"
        AF.request(url, interceptor: interceptor).responseData { [self] response in
            if let requestStatusCode = response.response?.statusCode {
                statusCode = requestStatusCode
            }
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(ProfileModel.self, from: data)
                    viewModel.profileScreenVM.id.wrappedValue = decodedData.id
                    viewModel.profileScreenVM.nickName.wrappedValue = decodedData.nickName ?? ""
                    viewModel.profileScreenVM.emailText.wrappedValue = decodedData.email
                    viewModel.profileScreenVM.avatarLinkText.wrappedValue = decodedData.avatarLink ?? ""
                    viewModel.profileScreenVM.nameText.wrappedValue = decodedData.name
                    viewModel.profileScreenVM.birthDateText.wrappedValue = decodedData.birthDate
                    viewModel.profileScreenVM.sexText.wrappedValue = decodedData.gender
                    completion(statusCode)
                } catch(let error) {
                    print("Error: ", error)
                    completion(statusCode)
                    return
                }
            case .failure(let error):
                print("Error: ", error)
                completion(statusCode)
                return
            }
            
        }
    }
    
    func putProfile(viewModel: Binding<ProfileScreenViewModel>, completion: @escaping (Int?) -> Void) {
        let url = baseURL + "/api/account/profile"
        let httpParameters: ProfileModel = ProfileModel(id: viewModel.id.wrappedValue, nickName: viewModel.nickName.wrappedValue, email: viewModel.emailText.wrappedValue, avatarLink: viewModel.avatarLinkText.wrappedValue, name: viewModel.nameText.wrappedValue, birthDate: "2023-02-10T10:09:24.793Z", gender: viewModel.sexText.wrappedValue ?? 0)
        AF.request(url, method: .put, parameters: httpParameters, encoder: JSONParameterEncoder.default, interceptor: interceptor).responseData { [self] response in
            if let requestStatusCode = response.response?.statusCode {
                statusCode = requestStatusCode
                completion(statusCode)
            }
            switch response.result {
            case .success(let data):
                do {
                    completion(statusCode)
                    return
                }
            case .failure(let error):
                print("Error: ", error)
                completion(statusCode)
                return
            }
        }
    }
    
}
