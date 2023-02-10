//
//  LogoutModel.swift
//  MovieCatalog
//
//  Created by admin on 10.02.2023.
//

import Foundation

struct LogoutModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case message = "message"
    }
    
    let token: String
    let message: String
    
}
