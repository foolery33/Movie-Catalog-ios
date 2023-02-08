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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginScreen()
            }
            .environmentObject(viewModel)
        }
    }
}
