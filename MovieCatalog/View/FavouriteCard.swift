//
//  FavouriteCard.swift
//  MovieCatalog
//
//  Created by admin on 29.01.2023.
//

import SwiftUI

struct FavouriteCard: View {
    
    var cardWidth: CGFloat
    var cardHeight: CGFloat
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("FilmCard")
                .resizable()
                .frame(width: cardWidth, height: cardHeight)
                .aspectRatio(contentMode: .fit)
            Image("DeleteFavourite")
                .padding(.top, 4)
                .padding(.trailing, 3)
        }
        .frame(width: 120, height: 172)
        .aspectRatio(contentMode: .fit)
    }
    
}

struct FavouriteCard_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteCard(cardWidth: 100, cardHeight: 144)
    }
}
