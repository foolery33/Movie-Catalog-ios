//
//  TokenModel.swift
//  MovieCatalog
//
//  Created by admin on 07.02.2023.
//

import Foundation

struct TokenModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }

    
    let token: String
    
}
