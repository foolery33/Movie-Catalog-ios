//
//  GalleryElement.swift
//  MovieCatalog
//
//  Created by admin on 29.01.2023.
//

import SwiftUI

struct GalleryElement: View {
    
    var filmName: String = "Люцифер"
    var filmYear: Int = 1999
    var filmCountry: String = "США"
    var filmGenres: String = "драма, криминал"
    var rating: Float = 9.0
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image("FilmCard")
                .resizable()
                .frame(width: 100, height: 144)
                .aspectRatio(contentMode: .fit)
            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    Text(filmName)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                    Text("\(filmYear) • \(filmCountry)")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                    Text(filmGenres)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                    Spacer().frame(height: 44)
                    Text(String(rating))
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .padding([.top, .bottom], 4)
                        .background(RoundedRectangle(cornerRadius: 16).fill(.green).frame(width: 56))
                        .frame(width: 56)
                }
                .frame(width: 144)
            }
            Spacer()
        }.frame(maxWidth: .infinity).preferredColorScheme(.dark)
    }
}

struct GalleryElement_Previews: PreviewProvider {
    static var previews: some View {
        GalleryElement()
    }
}
