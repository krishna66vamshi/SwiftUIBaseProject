//
//  ContentView.swift
//  ListGridsAfrica
//
//  Created by vamsi on 26/06/21.
//

import SwiftUI

struct AfricaContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")

    var body: some View {
            List{
                TabView {
                  ForEach(coverImages) { item in
                    Image(item.name)
                      .resizable()
                      .scaledToFill()
                  } //: LOOP
                } //: TAB
                .tabViewStyle(.page)
                .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .indexViewStyle(.page(backgroundDisplayMode: .always))

                
                ForEach(animals) { animalObj in
                    
                    HStack(spacing:20){
                        Image(animalObj.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90, height: 90, alignment: .center)
                            .cornerRadius(20)
                        
                        VStack(alignment:.leading,spacing:10){
                            Text(animalObj.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Text(animalObj.headline)
                                .lineLimit(2)
                                .font(.footnote)

                        }
                    }.padding(.all,5)
                    
                }
        }
    }
}

struct AfricaContentView_Previews: PreviewProvider {
    static var previews: some View {
        AfricaContentView()
    }
}
