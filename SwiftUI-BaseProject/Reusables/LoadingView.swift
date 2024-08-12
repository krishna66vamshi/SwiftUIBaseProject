//
//  LoadingView.swift
//  LoadingView
//
//  Created by Karin Prater on 20.08.21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
            
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 15)  {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
//                    .scaleEffect(2)
                Text("Loading...")
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: 80,maxHeight: 70,alignment: .center)
            .padding()
            .background(
                Color.white
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
            )
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
