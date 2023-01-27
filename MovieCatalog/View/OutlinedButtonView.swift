//
//  OutlinedButtonView.swift
//  MovieCatalog
//
//  Created by admin on 23.01.2023.
//

import SwiftUI

struct OutlinedButtonView: View {
    
    @Binding var areFilledFields: Bool
    var text: String
    
    var strokeColor: Color {
        areFilledFields ? Color.redColor : Color.strokeColor
    }
    
    var fillColor: Color {
        areFilledFields ? Color.redColor : Color.backgroundColor
    }
    
    var textColor: Color {
        areFilledFields ? Color.white : Color.redColor
    }
    
    var body: some View {
        Button {
            print(areFilledFields)
        } label: {
            Text(text)
                .frame(maxWidth: .infinity)
                .foregroundColor(textColor)
                .padding([.top, .bottom], 12)
                .font(.system(size: 16, weight: .bold))
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(strokeColor, lineWidth: 1).padding([.leading, .trailing], 0.3))
                .background(RoundedRectangle(cornerRadius: 8).fill(fillColor).frame(maxWidth: .infinity))
        }
    }
    
}

//struct OutlinedButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        OutlinedButtonView(areFilledFields: <#T##Binding<Bool>#>)
//    }
//}
