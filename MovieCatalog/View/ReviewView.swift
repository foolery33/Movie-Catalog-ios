//
//  ReviewView.swift
//  MovieCatalog
//
//  Created by admin on 29.01.2023.
//

import SwiftUI

struct ReviewView: View {
    var userName: String = "Ulyana"
    var isMyReview: Bool = true
    var reviewRating: Int = 3
    var reviewText: String = "Сразу скажу, что фильм мне понравился. Люблю Фримэна, уважаю Роббинса. Читаю Кинга. Но рецензия красненькая."
    var reviewDate: String = "07.10.2022"
    var body: some View {
        HStack(spacing: 0) {
            Spacer().frame(width: 0.2)
            VStack {
                HStack(alignment: .center, spacing: 08) {
                    Image("Ulya")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 0) {
                        Text(userName)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        if(isMyReview) {
                            Text("мой отзыв")
                                .foregroundColor(.strokeColor)
                                .font(.system(size: 12, weight: .regular))
                        }
                    }
                    Spacer()
                    Text(String(reviewRating))
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding([.top, .bottom], 4)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.redColor).frame(width: 42))
                        .frame(width: 42)
                    
                }
                Spacer().frame(height: 8)
                Text(reviewText)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer().frame(height: 4)
                HStack(spacing: 0) {
                    Text(reviewDate)
                        .foregroundColor(.strokeColor)
                        .font(.system(size: 12, weight: .regular))
                    Spacer()
                    if(isMyReview) {
                        Image("Pencil")
                            .padding(6)
                            .background(Circle().foregroundColor(.editReviewImageBackground))
                        Spacer().frame(width: 8)
                        Image("DeleteIcon")
                            .padding(8)
                            .background(Circle().foregroundColor(.deleteReviewImageBackground))
                    }
                }
            }.preferredColorScheme(.dark).padding(8).background(RoundedRectangle(cornerRadius: 8).stroke(Color.grayFaded, lineWidth: 1))
            Spacer().frame(width: 0.2)
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView()
    }
}
