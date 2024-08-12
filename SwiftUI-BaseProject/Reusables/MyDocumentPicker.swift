//
//  MyDocumentPicker.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 14/07/22.
//

import SwiftUI
import MobileCoreServices

struct MyDocumentPicker:UIViewControllerRepresentable{
    
    @Binding var pickedURls:[URL]

    
    func makeCoordinator() -> Coordinator {
        return MyDocumentPicker.Coordinator(parent1: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyDocumentPicker>) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(documentTypes: [
            String(kUTTypePDF),
            String(kUTTypeRTFD),
            String(kUTTypeItem)
        ], in: .open)
        picker.allowsMultipleSelection = false
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<MyDocumentPicker>) {
        
    }
    
    class Coordinator:NSObject,UIDocumentPickerDelegate{
        
        var parent:MyDocumentPicker
        
        init(parent1:MyDocumentPicker){
            parent = parent1
        }
        
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            print("picked document urls are \(urls)")
           
            parent.pickedURls = urls
        }
    }
}


