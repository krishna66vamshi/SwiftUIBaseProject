//
//  ViewModifiers.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 13/07/22.
//

import SwiftUI

struct DefaultTextViewModifier:ViewModifier{
   
    let bgColor:Color
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color.red)
            .padding()
            .background(bgColor)
            .padding()
        
    }
    
}

extension View{
    
    func setDefaultTextStyle(bgColor:Color) -> some View{
        modifier(DefaultTextViewModifier(bgColor: bgColor))
    }
}

struct ViewModifiers: View {
    var body: some View {
        VStack(spacing:20) {
            Text("Hello, View Modifiers")
                .setDefaultTextStyle(bgColor: Color.black)
            
            Text("Custom View Modifiers")
                .setDefaultTextStyle(bgColor: Color.blue)
        }
    }
}

struct ViewModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifiers()
    }
}
