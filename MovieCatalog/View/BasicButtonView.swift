//
//  BasicButtonView.swift
//  MovieCatalog
//
//  Created by admin on 24.01.2023.
//

import SwiftUI

struct BasicButtonView: View {
    var text: String
    var body: some View {
        Button {
            
        } label: {
            Text(text)
                .frame(maxWidth: .infinity)
                .foregroundColor(.redColor)
                .font(.system(size: 16, weight: .bold))
                .padding([.top, .bottom], 6)
        }
    }
}

struct BasicButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BasicButtonView(text: "Register")
    }
}
