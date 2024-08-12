//
//  MultiplePhotoPickerView.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 14/07/22.
//

import SwiftUI

struct MultiplePhotoPicker_View: View {
  var body: some View {
      MultiplePhotoPickerView()
  }
}

struct MultiplePhotoPickerView: View {
    @State private var photoPickerIsPresented = false
    @State var pickerResult: [UIImage] = []
    
    var body: some View {
      NavigationView {
        List {
          ForEach(pickerResult, id: \.self) { uiImage in
              Image(uiImage: uiImage)
                .resizable()
                .frame(height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30)
                .padding(10)
                .background(Color.red)
          }
          .padding()
        }
        .background(Color.green)
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("Select Photo", displayMode: .inline)
        .navigationBarItems(trailing: selectPhotoButton)
        .sheet(isPresented: $photoPickerIsPresented) {
            MultiplePhotoPicker(pickerResult: $pickerResult,
                      isPresented: $photoPickerIsPresented)
        }
      }
    }
    
    @ViewBuilder
    private var selectPhotoButton: some View {
      Button(action: {
        photoPickerIsPresented = true
      }, label: {
        Label("Select", systemImage: "photo")
      })
    }
  }

