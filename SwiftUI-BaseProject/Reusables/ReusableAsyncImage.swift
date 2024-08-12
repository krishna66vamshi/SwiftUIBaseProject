//
//  ReusableAsyncImage.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 12/07/22.
//

import SwiftUI

struct ReusableAsyncImage: View {
    
    var imageUrl:String
    let imageSize: CGFloat = 100
    
    var body: some View {
        AsyncImage(url: URL(string:imageUrl)) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                
            } else if phase.error != nil {
                Text(phase.error?.localizedDescription ?? "error")
                    .foregroundColor(Color.pink)
                    .frame(width: imageSize, height: imageSize)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: imageSize, height: imageSize)
            }
        }
    }
}
