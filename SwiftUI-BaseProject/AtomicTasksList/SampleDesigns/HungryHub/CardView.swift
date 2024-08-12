//
//  CardView.swift
//  HungryHubSwiftUI
//
//  Created by vamsi on 27/06/21.
//

import SwiftUI

struct CardView: View {
    
    var recipe: Recipe
    var callBack:(Recipe) -> () = {_ in }
    
    var body: some View {
        VStack(alignment:.leading){
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .clipShape(CustomCorner(corner: [.topLeft,.topRight]))
                .overlay(
                    Image(systemName: "bookmark")
                        .font(Font.title.weight(.light))
                        .foregroundColor(Color.white)
                        .imageScale(.small)
                        .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                        .padding(.trailing, 20)
                        .padding(.top, 22)
                    , alignment: .topTrailing
                )
            
            VStack(alignment:.leading){
                Text(recipe.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(recipe.headline)
                    .lineLimit(1)
            }
            .padding()
        }.onTapGesture {
            callBack(recipe)
        }
       
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray,lineWidth: 1.0)
        )
        .padding()
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes: [Recipe] = recipesData
        CardView(recipe: recipes[0])
    }
}
