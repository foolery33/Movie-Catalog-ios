//
//  RegisterParametersModel.swift
//  MovieCatalog
//
//  Created by admin on 09.02.2023.
//

import Foundation

struct RegisterParametersModel: Encodable {
    let userName: String
    let name: String
    let password: String
    let email: String
    let birthDate: String?
    let gender: Int?
    
    init(userName: String, name: String, password: String, email: String, birthDate: String? = nil, gender: Int? = nil) {
        self.userName = userName
        self.name = name
        self.password = password
        self.email = email
        self.birthDate = birthDate
        self.gender = gender
    }
    
}
