//
//  MainScreen.swift
//  MovieCatalog
//
//  Created by admin on 27.01.2023.
//

import SwiftUI

struct MainScreen: View {
    
    @State var firstVisibleIndex: Int = 0
    @State var visibleIndex: Set<Int> = [0]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    ZStack (alignment: .top) {
                        Image("MagiciansPoster").resizable().frame(height: 400).overlay(LinearGradient(gradient: Gradient(colors: [Color.transparentColor, .black]), startPoint: UnitPoint(x: 0.5, y: 0.8), endPoint: .bottom))
                        
                        Image("MagiciansText").padding(.top, 88)
                    }
                }.aspectRatio(contentMode: .fit)
                Spacer().frame(height: 32)
                SectionText(text: "Избранное").padding(.leading, 16)
                Spacer().frame(height: 16)
                GeometryReader { outerProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .top, spacing: 16) {
                            ForEach(0...10, id: \.self) { item in
                                GeometryReader { geometry in
                                    FavouriteCard(cardWidth: (item == firstVisibleIndex) ? 120 : 100, cardHeight: (item == firstVisibleIndex) ? 172: 144)
                                        .onChange(of: geometry.frame(in: .named("scrollView"))) { imageRect in
                                        if isInView(innerRect: imageRect, isIn: outerProxy) {
                                            visibleIndex.insert(item)
                                        } else {
                                            visibleIndex.remove(item)
                                        }
                                    }
                                }
                                .frame(minWidth: 100, maxWidth: 120)
                            }
                        }
                    }
                    .coordinateSpace(name: "scrollView")
                }.frame(height: 172)
                Spacer().frame(height: 16)
                SectionText(text: "Галерея").padding([.leading, .trailing], 16)
                Spacer().frame(height: 8)
                LazyVStack {
                    ForEach(0...10, id: \.self) { item in
                        GalleryElement()
                    }
                }.padding([.leading, .trailing], 16)
            }
            
        }
        .preferredColorScheme(.dark)
        .background(Color.backgroundColor)
    }
    
    private func isInView(innerRect:CGRect, isIn outerProxy:GeometryProxy) -> Bool {
        firstVisibleIndex = visibleIndex.sorted().first!
        print(firstVisibleIndex)
        if(innerRect.origin.x >= -1) {
            return true
        }
        return false
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
