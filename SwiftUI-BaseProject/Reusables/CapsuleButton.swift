//
//  CapsuleButton.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct CapsuleButton: View {
    var text: String
    var backgroundColor: Color = .red
    var textColor: Color = .black
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked, label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(textColor)
        })
        .padding()
        .background(
            backgroundColor
                .cornerRadius(25)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
        )
        
//        .clipShape(Capsule())
//        .background(
//            Color.clear
//                .cornerRadius(10)
//                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
//        )
    }
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleButton(text: "Test Capsule Button", backgroundColor: .red, textColor: .black) {
            
        }
    }
}
