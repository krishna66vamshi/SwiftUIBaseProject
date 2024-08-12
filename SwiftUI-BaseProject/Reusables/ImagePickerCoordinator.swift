//
//  ImagePickerCoordinator.swift
//  ImagePickerDemo
//
//  Created by vamsi on 07/09/20.
//  Copyright © 2020 hts. All rights reserved.
//

import SwiftUI

struct ImagePickerView:UIViewControllerRepresentable {
    
    @Binding var isPresented:Bool
    @Binding var pickedImage:UIImage
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = UIImagePickerController()
        vc.delegate = context.coordinator
        vc.allowsEditing = false
        vc.sourceType = .photoLibrary
        vc.mediaTypes = ["public.image", "public.movie"]
        return vc
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        let parent:ImagePickerView
        init(parent:ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let img = info[.originalImage] as? UIImage{
            if let  videoURL = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerReferenceURL") ] as? NSURL{
                print("PICKED videoURL is -> ",videoURL)
            }
            if let img = info[.originalImage] as? UIImage{
                parent.pickedImage = img
            }
            parent.isPresented.toggle()
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
