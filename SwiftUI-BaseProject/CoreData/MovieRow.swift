//
//  MovieRow.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 23/07/22.
//

import SwiftUI

struct MovieRow: View {
    
    let movieObj: MovieEntity
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            setupImageView
            VStack(alignment: .leading, spacing: 5) {
                Text(movieObj.title ?? "")
                    .font(.headline)
                Text(movieObj.createdDate?.formatted(date: .abbreviated, time: .standard) ?? "")
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
        )
        .padding()
        
    }
    
    @ViewBuilder
    var setupImageView:some View{
        if let data = movieObj.image{
            if let imgData = UIImage(data: data){
                Image(uiImage: imgData)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }else{
                Color.gray.frame(width: imageSize, height: imageSize)
            }
        }else{
            Color.gray.frame(width: imageSize, height: imageSize)
        }
    }
}
