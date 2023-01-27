//
//  OutlinedButton.swift
//  MovieCatalog
//
//  Created by admin on 22.01.2023.
//

import SwiftUI

struct OutlinedTextFieldView: View {
    @Binding var writtenText: String
    let placeholderText: String
    var body: some View {
        ZStack(alignment: .leading) {
            if(writtenText.isEmpty) {
                Text(placeholderText)
                    .padding(.leading, 16)
                    .foregroundColor(.grayFaded)
                    .font(.system(size: 14, weight: .regular))
            }
            TextField("", text: $writtenText)
                .foregroundColor(.redColor)
                .font(.system(size: 14, weight: .regular))
                .padding([.top, .bottom], 13)
                .padding(.leading, 16)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.strokeColor, lineWidth: 1).padding([.leading, .trailing], 0.3))
        }
    }
}

struct OutlinedTextFieldView_Previews: PreviewProvider {
    @State static var value = ""
    static var previews: some View {
        OutlinedTextFieldView(writtenText: $value, placeholderText: "asdasd")
    }
}
