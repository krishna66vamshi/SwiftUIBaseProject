//
//  DocumentPicker.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 14/07/22.
//

import SwiftUI

struct DocumentPicker: View {
    
    @State var show = false
    @State var showPDFViewerScreen = false
    @State var showPDFViewerUsingPickedUrl = false
    @State var pickedUrls = [URL]()

    
    var body: some View {
        VStack(spacing:30){
            
            Button {
                self.show.toggle()
            } label: {
                Text("DocumentPicker")
                    .font(.title2)
                    .fontWeight(.semibold)
            }.sheet(isPresented: $show) {
                MyDocumentPicker(pickedURls: $pickedUrls)
            }
            
            Button {
                print("pickedURLS :- \(pickedUrls)")
                
                showPDFViewerScreen.toggle()
            } label: {
                Text("Open Local PDF")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            //            .fullScreenCover(isPresented: $showPDFViewerScreen) {
            //                openPDF()
            //            }
            .sheet(isPresented: $showPDFViewerScreen) {
                openPDF()
            }
            
            Button {
                print("pickedURLS :- \(pickedUrls)")
                
                showPDFViewerUsingPickedUrl.toggle()
            } label: {
                Text("Open Picked PDF")
                    .foregroundColor(.black)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            //            .fullScreenCover(isPresented: $showPDFViewerScreen) {
            //                openPDF()
            //            }
            .sheet(isPresented: $showPDFViewerUsingPickedUrl) {
                openPDFScreen(pickedUrls: $pickedUrls)
//                if pickedUrls.count > 0{
//                openPDFUsingPickedUrl()
//                }
            }
            
//            if pickedUrls.count > 0{
//                MyWebView(url: pickedUrls[0])
//            }
        }
    }
    
    func openPDF() -> MyWebView{
        let path = Bundle.main.path(forResource: "gobt", ofType:  "pdf")
        let url = URL(fileURLWithPath: path!)
        return MyWebView(url: url)
    }
    
    func openPDFUsingPickedUrl() -> MyWebView{
        return MyWebView(url: pickedUrls[0])
    }
}

struct openPDFScreen:View{
    
    @Binding var pickedUrls:[URL]
    
    var body: some View{
        MyWebView(url: pickedUrls[0])
    }
}

struct DocumentPicker_Previews: PreviewProvider {
    static var previews: some View {
        DocumentPicker()
    }
}
