//
//  SectionText.swift
//  MovieCatalog
//
//  Created by admin on 27.01.2023.
//

import SwiftUI

struct SectionText: View {
    var text: String
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.redColor)
            .font(.system(size: 24, weight: .bold))
    }
}

struct SectionText_Previews: PreviewProvider {
    static var previews: some View {
        SectionText(text: "text")
    }
}
