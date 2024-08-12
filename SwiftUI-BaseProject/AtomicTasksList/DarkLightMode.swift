//
//  DarkLightMode.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 13/07/22.
//

import SwiftUI

struct DarkLightMode: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            VStack(spacing:20) {
                Text("Primary color is Adaptive")
                    .font(.title)
                    .foregroundColor(.primary)
                
                Text("Secondary Color is Adaptive")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text("Static Color , it will not change for both modes")
                    .font(.title)
                    .foregroundColor(.red)
                
                Text("Static Color , it will not change for both modes , try to avoid Static colors")
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color.green)
                
                Text("From Assets , This color is Adaptive")
                    .font(.title)
                    .foregroundColor(Color("DarkLightAppColor"))
                
                Text("Using Environment colorScheme programatically")
                    .font(.title)
                    .foregroundColor(colorScheme == .light ? .orange : .yellow)
            }
            .padding()
    }
}

struct DarkLightMode_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        DarkLightMode()
            .preferredColorScheme(.dark)
            
            DarkLightMode()
                .preferredColorScheme(.light)
        }
    }
}
