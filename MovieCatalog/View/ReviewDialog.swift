//
//  ReviewDialog.swift
//  MovieCatalog
//
//  Created by admin on 02.02.2023.
//

import SwiftUI
import SwiftUIFlowLayout

struct ReviewDialog: View {
    
    @State var lastFilledStarIndex: Int = -1
    @State var writtenText: String = ""
    @State var showCheck: Bool = false
    @State var buttonPosition: Bool = true
    
    @Binding var showReviewDialog: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.reviewDialogColor)
            VStack(spacing: 16) {
                Text("Оставить отзыв")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 0) {
                    ForEach(0..<10, id: \.self) { star in
                        HStack(spacing: 0) {
                            Star(index: star, lastFilledStarIndex: $lastFilledStarIndex)
                        }
                    }
                }
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 6).fill(.white)
                    if(writtenText.isEmpty) {
                        Text("Отзыв")
                            .foregroundColor(.reviewDialogPlaceholderColor)
                            .font(.custom("Montserrat", size: 13.7))
                            .padding([.leading, .trailing], 9)
                            .padding([.top, .bottom], 11)
                    }
                    TextField("", text: $writtenText, axis: .vertical)
                        .padding([.leading, .trailing], 9)
                        .padding([.top, .bottom], 11)
                        .frame(height: 120, alignment: .topLeading)
                        .foregroundColor(.reviewDialogTextColor)
                        .font(.custom("Montserrat", size: 13.7))
                        .multilineTextAlignment(.leading)
                }.frame(height: 120)
                HStack {
                    Text("Анонимный отзыв")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.grayFaded, lineWidth: 1)
                        Image("Check")
                            .opacity(showCheck ? 1 : 0)
                            .frame(width: 22, height: 22)
                    }
                    .frame(width: 22, height: 22)
                    .onTapGesture {
                        showCheck.toggle()
                    }
                }
                VStack(spacing: 8) {
                    
                    OutlinedButtonView(areFilledFields: $buttonPosition, text: "Сохранить") {
                        hideReviewDialog()
                    }
                    BasicButtonView(text: "Отмена") {
                        hideReviewDialog()
                    }
                    
                }
                
            }
            .padding(16)
        }
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: .infinity)
        .clipped()
    }
    
    func hideReviewDialog() -> Void {
        showReviewDialog.toggle()
    }
    
}


struct Star: View {
    
    var index: Int
    @Binding var lastFilledStarIndex: Int
    
    var body: some View {
        
        ZStack {
            if(index <= lastFilledStarIndex) {
                Image("FilledStar").padding(3)
                Circle().fill(Color.redColor).opacity(0.1)
            }
            else {
                Image("UnfilledStar").padding(3)
                Circle().fill(Color.redColor).opacity(0)
            }
        }
        .frame(width: 24, height: 24)
        .onTapGesture {
            lastFilledStarIndex = index
        }
        if(index != 9) {
            Spacer()
        }
        
    }
}

//struct ReviewDialog_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewDialog()
//    }
//}
