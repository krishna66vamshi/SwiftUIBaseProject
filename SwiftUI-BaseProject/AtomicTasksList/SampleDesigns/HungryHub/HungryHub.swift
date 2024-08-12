//
//  HungryHub.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct HungryHub: View {
    
    var recipes: [Recipe] = recipesData
    
    
    var body: some View {            
            ScrollView{
                
                HStack{
                    Text("Section 1")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                ScrollView(.horizontal,showsIndicators:false){
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(recipes){ recipe in
                            CardView(recipe: recipe,callBack: { selectedRecipe in
                                print("selectedRecipe",selectedRecipe.title)
                            })
                                .frame(maxWidth:300,maxHeight: 300)
                        }
                    }
                }
                
                
                HStack{
                    Text("Section 2")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Spacer()
                }
                
                ScrollView{
                    ForEach(recipes){ recipe in
                        CardView(recipe: recipe)
                    }
                }
                
                
            

        }
        
        
    }
}

struct HungryHub_Previews: PreviewProvider {
    static var previews: some View {
        HungryHub()
    }
}
