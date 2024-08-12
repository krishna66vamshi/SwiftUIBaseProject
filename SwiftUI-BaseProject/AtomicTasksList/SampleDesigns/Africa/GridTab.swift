//
//  GridTab.swift
//  ListGridsAfrica
//
//  Created by vamsi on 26/06/21.
//

import SwiftUI

struct GridTab: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var gridColumn: Double = 3.0
    
    var body: some View {
        
        ScrollView{
            VStack{
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.all,20)
                
                /*https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
                 1.GridItem(.flexible())
                 2.GridItem(.fixed(100))
                 3.GridItem(.adaptive(minimum: 80))
                */
                
                LazyVGrid(columns: Array(repeating:GridItem(.flexible()), count: Int(gridColumn)), alignment: .center, spacing: 10, pinnedViews: [], content: {
                    ForEach(animals){ animalObj in
                        Image(animalObj.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                    }
                })
                Spacer()
            }.padding()
        }
    }
}

struct GridTab_Previews: PreviewProvider {
    static var previews: some View {
        GridTab()
    }
}
