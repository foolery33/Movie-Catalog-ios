//
//  MainScreen.swift
//  MovieCatalog
//
//  Created by admin on 27.01.2023.
//

import SwiftUI

struct MainScreen: View {
    
    @EnvironmentObject var viewModel: GeneralViewModel
    @State var itemPressed: Int = 0
    @State var firstVisibleIndex: Int = 0
    @State var visibleIndex: Set<Int> = [0]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    GeometryReader { geo in
                        ZStack (alignment: .top) {
                            Image("MagiciansPoster").resizable().frame(height: 400).overlay(LinearGradient(gradient: Gradient(colors: [Color.transparentColor, .black]), startPoint: UnitPoint(x: 0.5, y: 0.8), endPoint: .bottom))
                            
                            Image("MagiciansText").padding(.top, 88)
                            VStack {
                                Spacer()
                                NavigationLink(destination: MovieScreen().navigationBarBackButtonHidden(true)) {
                                    Text("Смотреть")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                        .padding([.leading, .trailing], 43.5)
                                        .padding([.top, .bottom], 12)
                                        .background(RoundedRectangle(cornerRadius: 4).fill(Color.redColor))
                                }
                                Spacer().frame(height: 64)
                            }
                        }
                    }.frame(height: 400)
                    Spacer().frame(height: 32)
                    SectionText(text: "Избранное").padding(.leading, 16)
                    Spacer().frame(height: 16)
                    GeometryReader { outerProxy in
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(alignment: .top, spacing: 16) {
                                ForEach(0...10, id: \.self) { item in
                                    NavigationLink(destination: MovieScreen().navigationBarBackButtonHidden(true)) {
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
                                    }.navigationBarBackButtonHidden(true)
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
                            NavigationLink(destination: MovieScreen().navigationBarBackButtonHidden(true)) {
                                GalleryElement()
                            }
                        }
                    }.padding([.leading, .trailing], 16)
                    Spacer().frame(height: 16)
                }
                Spacer().frame(height: 85)
            }
            .edgesIgnoringSafeArea(.top)
            .preferredColorScheme(.dark)
            .background(Color.backgroundColor)
            BottomBar(itemPressed: $itemPressed)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func isInView(innerRect:CGRect, isIn outerProxy:GeometryProxy) -> Bool {
        firstVisibleIndex = visibleIndex.sorted().first ?? 0
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
