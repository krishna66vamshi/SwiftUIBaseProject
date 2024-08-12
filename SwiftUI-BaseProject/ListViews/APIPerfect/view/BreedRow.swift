//
//  BreedRow.swift
//  BreedRow
//
//  Created by Karin Prater on 20.08.21.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            if breed.image?.url != nil {
                ReusableAsyncImage(imageUrl: breed.image!.url!)
            }else{
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
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
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
