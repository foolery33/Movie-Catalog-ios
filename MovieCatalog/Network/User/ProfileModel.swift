//
//  ProfileModel.swift
//  MovieCatalog
//
//  Created by admin on 10.02.2023.
//

import Foundation

struct ProfileModel: Decodable, Encodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nickName = "nickName"
        case email = "email"
        case avatarLink = "avatarLink"
        case name = "name"
        case birthDate = "birthDate"
        case gender = "gender"
    }

    init (id: String, nickName: String? = nil, email: String, avatarLink: String? = nil, name: String, birthDate: String, gender: Int) {
        self.id = id
        self.nickName = nickName
        self.email = email
        self.avatarLink = avatarLink
        self.name = name
        self.birthDate = birthDate
        self.gender = gender
        
    }
    let id: String
    let nickName: String?
    let email: String
    let avatarLink: String?
    let name: String
    let birthDate: String
    let gender: Int
}
