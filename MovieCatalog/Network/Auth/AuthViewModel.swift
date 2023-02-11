//
//  AuthViewModel.swift
//  MovieCatalog
//
//  Created by admin on 07.02.2023.
//

import SwiftUI
import Alamofire

class AuthViewModel: ObservableObject {
    
    @Published var accessToken: TokenModel = TokenModel(token: "")
    
    var statusCode: Int? = nil
    private let baseURL = "https://react-midterm.kreosoft.space"
    private let interceptor: CustomRequestInterceptor = CustomRequestInterceptor()
    
    func login(userName: String, password: String, isPressedButton: Binding<Bool>, completion: @escaping (Int?) -> Void) {
        let httpParameters: [String: String] = [
            "userName": userName,
            "password": password
        ]
        let url = baseURL + "/api/account/login"
        AF.request(url, method: .post, parameters: httpParameters, encoder: JSONParameterEncoder.default, interceptor: interceptor).responseData { [self] response in
            if let requestStatusCode = response.response?.statusCode {
                statusCode = requestStatusCode
                //completion(statusCode)
            }
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(TokenModel.self, from: data)
                    accessToken = decodedData
                    //TokenManager.shared.saveAccessToken(accessToken: accessToken.token)
                    TokenManager.shared.saveData(login: userName, password: password, accessToken: accessToken.token)
                    isPressedButton.wrappedValue = true
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
    
    func register(userName: String, name: String, password: String, email: String, birthDate: String?, gender: Int?, isPressedButton: Binding<Bool>, completion: @escaping (Int?) -> Void) {
        let httpParameters: RegisterParametersModel = RegisterParametersModel(userName: userName, name: name, password: password, email: email)
        let url = baseURL + "/api/account/register"
        AF.request(url, method: .post, parameters: httpParameters, encoder: JSONParameterEncoder.default, interceptor: interceptor).responseData { [self] response in
            if let requestStatusCode = response.response?.statusCode {
                statusCode = requestStatusCode
                //                completion(statusCode)
            }
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(TokenModel.self, from: data)
                    accessToken = decodedData
                    TokenManager.shared.saveAccessToken(accessToken: accessToken.token)
                    isPressedButton.wrappedValue = true
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
    
    func logout(isPressedButton: Binding<Bool>, completion: @escaping (Int?) -> Void) {
        let url = baseURL + "/api/account/logout"
        AF.request(url, method: .post, interceptor: interceptor).responseData { [self] response in
            if let requestStatusCode = response.response?.statusCode {
                statusCode = requestStatusCode
                completion(statusCode)
            }
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(LogoutModel.self, from: data)
                    if(decodedData.message == "Logged Out") {
                        TokenManager.shared.clearToken()
                        print(TokenManager.shared.fetchAccessToken())
                        isPressedButton.wrappedValue = true
                    }
                    else {
                        print("")
                        completion(401)
                    }
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
    
}

