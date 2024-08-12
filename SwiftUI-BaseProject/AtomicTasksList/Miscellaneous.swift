//
//  miscellaneous.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 13/07/22.
//

import SwiftUI

struct Miscellaneous: View {
    
    var body: some View {
        VStack(spacing:20) {
            Group{
            Text("This is regular text.")
                    .foregroundColor(.primary)
            Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
            Text("~~A strikethrough example~~")
            Text("`Monospaced works too`")
            Text("Visit Apple: [click here](https://apple.com)")
            }.foregroundColor(.primary)
        }
    }
}

struct miscellaneous_Previews: PreviewProvider {
    static var previews: some View {
        Miscellaneous()
            .preferredColorScheme(.light)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
    }
}
