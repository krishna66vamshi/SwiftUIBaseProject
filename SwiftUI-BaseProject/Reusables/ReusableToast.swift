//
//  ReusableToast.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 20/07/22.
//

import SwiftUI

struct ReusableToast: View {
    
    var text:String = "This is the sample Toast Message"
    
    var body: some View{
        ZStack{
            Color.black
            
            HStack{
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                Text(text)
                    .foregroundColor(.white)
            }
            .padding(.horizontal,10)
        }
        .cornerRadius(12)
        .padding()
        .frame(height: 20, alignment: .center)
    }
}

struct ReusableToast_Previews: PreviewProvider {
    static var previews: some View {
        ReusableToast()
    }
}
