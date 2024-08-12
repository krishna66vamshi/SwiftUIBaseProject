//
//  SampleProfileScreen.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct SampleProfileScreen: View {
    var body: some View {
        
        ScrollView{
            VStack(spacing:15) {
                Image("v")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                Text("Virat Kohli")
                    .font(.title2)
                    .contextMenu {
                        CapsuleButton(text: "Menu 1",backgroundColor: .green,textColor: .black) {
                           
                        }
                        
                        CapsuleButton(text: "Menu 2",backgroundColor: .green,textColor: .black) {
                           
                        }
                        
                        CapsuleButton(text: "Menu 3",backgroundColor: .green,textColor: .black) {
                           
                        }
                    }
                Text("Cricketer")
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 40, alignment: .center)
                    .overlay(Button(action: {}, label: {
                        Text("Share Account")
                            .foregroundColor(Color.white)
                            .fontWeight(.medium)
                    })).shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                
                LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                ], alignment: .center, spacing: 10, content: {
                    ForEach(0..<10){ i in
                            RoundedRectangle(cornerRadius: 20)
                        .frame(width: 190, height: 200, alignment: .center)
                        .foregroundColor(Color.secondary)
                        .overlay(VStack{
                            Text("Shopping \(i)")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        })
                    }
                }).padding(.horizontal,10)
            }
        }
    }
}

struct SampleProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        SampleProfileScreen()
    }
}
