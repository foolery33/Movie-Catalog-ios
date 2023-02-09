//
//  SecureFieldView.swift
//  MovieCatalog
//
//  Created by admin on 25.01.2023.
//

import SwiftUI

struct SecureFieldView: View {
    @Binding var writtenText: String
    let placeholderText: String
    let isNecessary: Bool
    var body: some View {
        ZStack(alignment: .leading) {
            if(writtenText.isEmpty) {
                HStack(spacing: 0) {
                    Text(placeholderText)
                        .padding(.leading, 16)
                        .foregroundColor(.grayFaded)
                        .font(.system(size: 14, weight: .regular))
                    if(isNecessary) {
                        Text("*")
                            .foregroundColor(.redColor)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
            }
            SecureField("", text: $writtenText)
                .foregroundColor(.redColor)
                .font(.system(size: 14, weight: .regular))
                .padding([.top, .bottom], 13)
                .padding(.leading, 16)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.strokeColor, lineWidth: 1).padding([.leading, .trailing], 0.3))
        }
    }
}

struct SecureFieldView_Previews: PreviewProvider {
    @State static var writtenText: String = ""
    static var previews: some View {
        SecureFieldView(writtenText: $writtenText, placeholderText: "password", isNecessary: true)
    }
}
