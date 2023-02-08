//
//  GeneralViewModel.swift
//  MovieCatalog
//
//  Created by admin on 07.02.2023.
//

import Foundation
import SwiftUI

class GeneralViewModel: ObservableObject {
    
    @Published var loginScreenVM: LoginScreenViewModel = LoginScreenViewModel()
    @Published var registerScreenVM: RegisterScreenViewModel = RegisterScreenViewModel()
    @Published var profileScreenVM: ProfileScreenViewModel = ProfileScreenViewModel()
    @Published var authVM: AuthViewModel = AuthViewModel()
    
}
