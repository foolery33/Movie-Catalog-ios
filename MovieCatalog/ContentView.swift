//
//  ContentView.swift
//  MovieCatalog
//
//  Created by admin on 04.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RegisterScreen(viewModel: RegisterScreenViewModel())
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
