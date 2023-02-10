//
//  MovieCatalogApp.swift
//  MovieCatalog
//
//  Created by admin on 04.01.2023.
//

import SwiftUI

@main
struct MovieCatalogApp: App {
    
    @StateObject var viewModel: GeneralViewModel = GeneralViewModel()
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if(TokenManager.shared.fetchAccessToken().isEmpty) {
                    LoginScreen()
                }
                else {
                 MainScreen()
                }
            }
            .environmentObject(viewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
