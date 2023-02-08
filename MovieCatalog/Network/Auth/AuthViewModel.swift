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
    private let interceptor = CustomRequestInterceptor()
    
    func login(userName: String, password: String, isPressedButton: Binding<Bool>, completion: @escaping (Int?) -> Void) {
        
        let httpParameters: [String: String] = [
            "userName": userName,
            "password": password
        ]
        
        let url = baseURL + "/api/account/login"
        
        AF.request(url, method: .post, parameters: httpParameters, encoder: JSONParameterEncoder.default, interceptor: interceptor).responseData { [self] response in
            
            if let requestStatusCode = response.response?.statusCode {
                statusCode = requestStatusCode
                completion(statusCode)
            }
            
            switch response.result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(TokenModel.self, from: data)
                    accessToken = decodedData
                    TokenManager.shared.saveAccessToken(accessToken: accessToken.token)
                    isPressedButton.wrappedValue = true
                } catch(let error) {
                    print("Error: ", error)
                    return
                }
            case .failure(let error):
                print("Error: ", error)
                return
            }
            
        }
    }
    
}

