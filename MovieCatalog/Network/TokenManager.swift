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
    
    func fetchLogin() -> String {
        KeychainWrapper.standard.string(forKey: "login") ?? ""
    }
    func fetchPassword() -> String {
        KeychainWrapper.standard.string(forKey: "password") ?? ""
    }
    
    func fetchAccessToken() -> String {
        KeychainWrapper.standard.string(forKey: "accessToken") ?? ""
//        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InN0MTExcmluZyIsImVtYWlsIjoic3RyaW5nIiwibmJmIjoxNjc2MDIzODUzLCJleHAiOjE2NzYwMjc0NTMsImlhdCI6MTY3NjAyMzg1MywiaXNzIjoiaHR0cHM6Ly9yZWFjdC1taWR0ZXJtLmtyZW9zb2Z0LnNwYWNlLyIsImF1ZCI6Imh0dHBzOi8vcmVhY3QtbWlkdGVybS5rcmVvc29mdC5zcGFjZS8ifQ.WySXBnI9gnhShCctQqoCuhp5fCil9ggH4BEzMasNuIQ"
    }
    func saveLogin(login: String) -> Void {
        KeychainWrapper.standard.set(login, forKey: "login")
    }
    func savePassword(password: String) -> Void {
        KeychainWrapper.standard.set(password, forKey: "password")
    }
    func saveAccessToken(accessToken: String) -> Void {
        KeychainWrapper.standard.set(accessToken, forKey: "accessToken")
    }
    func clearToken() {
        KeychainWrapper.standard.set("", forKey: "accessToken")
    }
    
    func saveData(login: String, password: String, accessToken: String) {
        KeychainWrapper.standard.set(login, forKey: "login")
        KeychainWrapper.standard.set(password, forKey: "password")
        KeychainWrapper.standard.set(accessToken, forKey: "accessToken")
    }
    
}
