//
//  CreateMovie.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 23/07/22.
//

import SwiftUI

struct CreateMovie: View {
    
    @State private var newMovieTitle: String = ""
    @Binding var needsRefresh: Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isShowingImagePicker = false
    @State var pickedImage = UIImage()
    
    var isFromEdit = false
    var movieObj: MovieEntity
    let imageSize: CGFloat = 200

    
    var body: some View {
        NavigationView{
            VStack(spacing:40){
                if !isFromEdit{
                Image(uiImage: pickedImage)
                    .resizable()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 4))
                    .shadow(radius: 10)
                    .frame(width: 200, height: 200, alignment: .leading)
                    .onTapGesture {
                        self.isShowingImagePicker.toggle()
                    }
                }else{
                    setupImageView
                }
                editGroup
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(isFromEdit ? "UPDATE MOVIE" : "ADD MOVIE")
        }.sheet(isPresented: $isShowingImagePicker) {
            ImagePickerView(isPresented: self.$isShowingImagePicker, pickedImage: self.$pickedImage)
        }
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
    
    var editGroup:some View{
        Group{
            TextField(isFromEdit ?  (movieObj.title ?? "") : "Enter Movie Name", text: $newMovieTitle)
                .foregroundColor(.pink)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .padding(.leading)
                .frame(height: 55)
                .background(
                    Color(UIColor.secondarySystemBackground)
                )
                .cornerRadius(10)
                .padding(.horizontal)
            
            Button(action: {
                if isFromEdit{
                    updateItem()
                }else{
                    addItem()
                }
            }, label: {
                Text(isFromEdit ?  "UPDATE" : "SAVE")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .frame(height: 55)
                    .frame(maxWidth:.infinity)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            .padding(.horizontal)
        }
        
    }
    
    private func addItem() {
        if !newMovieTitle.isEmpty{
            let imgData = pickedImage.jpegData(compressionQuality: 0.2)!
            CoreDataManager.shared.saveMovie(title: newMovieTitle,imgData: imgData,createdDate: Date())
            newMovieTitle = ""
            pickedImage = UIImage()
            hideKeyboard()
            needsRefresh.toggle()
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private func updateItem() {
        if !newMovieTitle.isEmpty{
            if let imgData = pickedImage.jpegData(compressionQuality: 0.2){
                movieObj.image = imgData
            }
            movieObj.createdDate = Date()
            movieObj.title = newMovieTitle
            CoreDataManager.shared.updateMovie()
            hideKeyboard()
            pickedImage = UIImage()
            newMovieTitle = ""
            needsRefresh.toggle()
            presentationMode.wrappedValue.dismiss()
        }
    }
}
