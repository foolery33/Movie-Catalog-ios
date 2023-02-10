//
//  BottomBar.swift
//  MovieCatalog
//
//  Created by admin on 06.02.2023.
//

import SwiftUI

struct BottomBar: View {
    
    @Binding var itemPressed: Int
    
    var body: some View {
        HStack(spacing: 0) {
            NavigationLink(destination: MainScreen()) {
                BottomBarItem(image: Image("tv"), text: "Главное", isItemPressed: itemPressed == 0)
            }
            NavigationLink(destination: ProfileScreen().navigationBarBackButtonHidden(true)) {
                BottomBarItem(image: Image("Person"), text: "Профиль", isItemPressed: itemPressed == 1)
            }
        }
        .background(Rectangle().fill(Color.bottomBarBackgroundColor))
        .frame(height: 85)
    }
}

struct BottomBarItem: View {
    
    var image: Image
    var text: String
    var isItemPressed: Bool
    
    var tintColor: Color {
        return isItemPressed ? Color.redColor : Color.strokeColor
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer().frame(height: 12)
            image
                .renderingMode(.template)
                .foregroundColor(tintColor)
            Text(text)
                .foregroundColor(tintColor)
                .font(.system(size: 14, weight: .medium))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.5, height: 85)
    }
}

struct BottomBar_Previews: PreviewProvider {
    
    @State static var itemPressed = 0
    
    static var previews: some View {
        //BottomBarItem(image: Image("Person"), text: "Profile")
        BottomBar(itemPressed: $itemPressed)
    }
}
