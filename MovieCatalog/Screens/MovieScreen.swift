//
//  MovieScreen.swift
//  MovieCatalog
//
//  Created by admin on 29.01.2023.
//

import SwiftUI
import SwiftUIFlowLayout
import Introspect
import ScalingHeaderScrollView

struct MovieScreen: View {
    
    var filmName: String = "Побег из Шоушенка"
    var filmText: String = "Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения"
    var filmYear: Int = 1994
    var filmCountry: String = "США"
    var filmTime: String = "142 мин."
    var filmTagline: String = "«Страх - это кандалы. Надежда - это свобода»"
    var filmProducer: String = "Фрэнк Дарабонт"
    var filmBudget: String = "$25 000 000"
    var filmFees: String = "$28 418 687"
    var filmAgeLimit = "16+"
    var filmGenres = ["драма", "боевик", "фантастика", "мелодрама"]
    
    @State var collapseProgress: CGFloat = 0
    @State var showReviewDialog: Bool = false
    
    var body: some View {
        ZStack {
            ScalingHeaderScrollView(header: {
                ZStack {
                    ZStack(alignment: .bottom) {
                        Image("MovieScreenPoster")
                            .resizable()
                            .frame(height: 250)
                            .overlay(LinearGradient(gradient: Gradient(colors: [Color.transparentColor, .black]), startPoint: UnitPoint(x: 0.5, y: 0.8), endPoint: .bottom))
                        Text(filmName)
                            .foregroundColor(.white)
                            .font(.system(size: 36, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .trailing], 16)
                    }.opacity(1 - collapseProgress)
                    if(collapseProgress == 1) {
                        ZStack {
                            Rectangle().fill(Color.movieScreenHeaderColor).edgesIgnoringSafeArea(.all).frame(height: 100)
                            VStack(spacing: 0) {
                                Spacer().frame(height: 44)
                                HStack {
                                    NavigationLink(destination: MainScreen()) {
                                        Image("Arrow")
                                    }
                                    Spacer()
                                    Text(filmName)
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold))
                                        .frame(maxWidth: 300, maxHeight: 32)
                                        .truncationMode(.tail)
                                    Spacer()
                                    Image("UnfilledHeart")
                                    Spacer().frame(width: 16)
                                }
                            }
                        }
                    }
                }
            }, content: {
                VStack(spacing: 0) {
                    Spacer().frame(height: 16)
                    Group {
                        Text(filmText)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                        Spacer().frame(height: 16)
                        Text("О фильме")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                        Spacer().frame(height: 8)
                        VStack {
                            AboutFilmRow(columnName: "Год", columnDescription: String(filmYear))
                            AboutFilmRow(columnName: "Страна", columnDescription: filmCountry)
                            AboutFilmRow(columnName: "Время", columnDescription: filmTime)
                            AboutFilmRow(columnName: "Слоган", columnDescription: filmTagline)
                            AboutFilmRow(columnName: "Режиссёр", columnDescription: filmProducer)
                            AboutFilmRow(columnName: "Бюджет", columnDescription: filmBudget)
                            AboutFilmRow(columnName: "Сборы в мире", columnDescription: filmFees)
                            AboutFilmRow(columnName: "Возраст", columnDescription: filmAgeLimit)

                        }
                        Spacer().frame(height: 16)
                    }
                    Text("Жанры")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer().frame(height: 8)
                    FlowLayout(mode: .scrollable, items: filmGenres, itemSpacing: 4) {
                        Text($0)
                            .foregroundColor(.sexTextColor)
                            .padding([.leading, .trailing], 16)
                            .padding([.top, .bottom], 6)
                            .font(.system(size: 12, weight: .medium))
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.redColor))
                    }.aspectRatio(contentMode: .fit).padding([.leading, .trailing], -4)
                    Group {
                        Spacer().frame(height: 16)
                        HStack {
                            Text("Отзывы")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            Spacer()
                            Image("AddReview")
                                .padding(4)
                                .onTapGesture {
                                    showReviewDialog.toggle()
                                }
                        }
                        Spacer().frame(height: 8)
                        LazyVStack(spacing: 8) {
                            ForEach(0...10, id: \.self) { item in
                                ReviewView()
                            }
                        }
                    }
                    Spacer()
                }.padding([.leading, .trailing], 16)
            })
            .height(min: 100, max: 250)
            .allowsHeaderCollapse()
            .hideScrollIndicators()
            .collapseProgress($collapseProgress)
            .edgesIgnoringSafeArea(.all)
            .preferredColorScheme(.dark)
            .background(Color.backgroundColor)
            
            if(showReviewDialog) {
                ReviewDialog(showReviewDialog: $showReviewDialog)
            }
        }
        .onAppear {
            
        }
    }
    
}

struct AboutFilmRow: View {
    var columnName: String
    var columnDescription: String
    var body: some View {
        HStack(alignment: .top) {
            Text(columnName)
                .frame(width: 100, alignment: .leading)
                .foregroundColor(.aboutFilmColor)
                .font(.system(size: 12, weight: .medium))
            Spacer().frame(width: 8)
            Text(columnDescription)
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .medium))
            Spacer()
        }.preferredColorScheme(.dark)
    }
}

struct MovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
