//
//  TokenManager.swift
//  MovieCatalog
//
//  Created by admin on 07.02.2023.
//

import Foundation
import SwiftKeychainWrapper

class TokenManager {
    
    static let shared = TokenManager()
    
    func fetchAccessToken() -> String {
        KeychainWrapper.standard.string(forKey: "accessToken") ?? ""
    }
    func saveAccessToken(accessToken: String) -> Void {
        KeychainWrapper.standard.set(accessToken, forKey: "accessToken")
    }
    func clearToken() {
        KeychainWrapper.standard.set("", forKey: "accessToken")
    }
    
}
