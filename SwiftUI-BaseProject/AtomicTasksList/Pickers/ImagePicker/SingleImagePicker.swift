//
//  SingleImagePicker.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct SingleImagePicker: View {
    
    @State var isShowingImagePicker = false
    @State var pickedImage = UIImage()
    
    var body: some View {
        NavigationView{
            VStack(spacing:40){
                Image(uiImage: pickedImage)
                    .resizable()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 4))
                    .shadow(radius: 10)
                    .frame(width: 200, height: 200, alignment: .leading)
                Button(action: {
                    self.isShowingImagePicker.toggle()
                }) {
                    Text("Select Image")
                }
                .padding(10)
                .foregroundColor(.black)
                .background(Color.blue)
                .font(.largeTitle)
                .clipShape(Capsule())
            }.sheet(isPresented: $isShowingImagePicker) {
                ImagePickerView(isPresented: self.$isShowingImagePicker, pickedImage: self.$pickedImage)
            }
            .navigationBarTitle("Image Picker Demo")
        }
    }
}

struct SingleImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        SingleImagePicker()
    }
}
