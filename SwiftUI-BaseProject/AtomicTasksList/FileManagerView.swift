//
//  FileManagerView.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 23/07/22.
//

import SwiftUI

extension FileManager{
    static var getDocumentDirectory:URL?{
        let fileManager = FileManager.default
        guard let folder = fileManager.urls(for: .documentDirectory,
                                            in: .userDomainMask).first else {
            return nil
        }
        return folder
    }
}


class FileManagerViewModel:ObservableObject{
    
    @Published var image:UIImage? = nil
    
    init() {
        getImage(name: "v")
        //        saveImage(name: "v")
    }
    
    func getImage(name:String){
        guard let path = getPathForImage(name: name) else{return}
        
        let isPathExists = FileManager.default.fileExists(atPath: path.path)
        
        if !isPathExists{
            print("PATH NOT FOUND")
            image = nil
            return
        }
        image = UIImage(contentsOfFile: path.path)
    }
    
    func saveImage(name:String){
        let image = UIImage(named: name)!
        guard let imgData = image.jpegData(compressionQuality: 0.5) else {
            print("Error converting image to data")
            return
        }
        guard let path = getPathForImage(name: "v") else{return}
        do {
            try imgData.write(to: path, options: .atomicWrite)
            print("SUCCESS SAVING IMAGE")
        } catch let err {
            print("failed saving image \(err.localizedDescription)")
        }
    }
    
    func deleteImage(name:String){
        guard let path = getPathForImage(name: name) else{return}
        let isPathExists = FileManager.default.fileExists(atPath: path.path)
        
        if !isPathExists{
            print("PATH NOT FOUND")
            return
        }
        
        do{
            try FileManager.default.removeItem(at: path)
            print("SUCCESSFULLY DELETED")
            image = nil
        }catch let err{
            print("ERROR DELETING IMAGE \(err.localizedDescription)")
        }
        
    }
    
    //Using Default directory path
    func getPathForImage(name:String) -> URL?{
        guard let path = FileManager.getDocumentDirectory?.appendingPathComponent("\(name).jpg") else{
            print("Error appending path")
            return nil
        }
        return path
    }
    
    //creating custom folder path and saving Image ex:- Screenshots
    func createDirectory(jpegData:Data,pathStr:String){
        let fileManager = FileManager.default
        guard let folder = fileManager.urls(for: .documentDirectory,
                                            in: .userDomainMask).first else {
            return
        }
        let screenshotsFolder = folder.appendingPathComponent("Screenshots")
        let screenshotsFolderPath =  screenshotsFolder.appendingPathComponent(pathStr+".png")
        if !fileManager.fileExists(atPath: screenshotsFolder.path){
            try! fileManager.createDirectory(atPath: screenshotsFolder.path, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already directory created.")
        }
        print(screenshotsFolderPath)
        do {
            try jpegData.write(to: screenshotsFolderPath, options: .atomicWrite)
        } catch  {
            print("failed")
        }
    }
    
    func storeDataAsTextFileInFileManager(_ name:String){
        let file = "windowevents.txt"
        var finalText = name
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                let storedTextStr = try String(contentsOf: fileURL, encoding: .utf8)
                print("storedTextStr",storedTextStr)
                if storedTextStr != "" || !storedTextStr.isEmpty{
                    finalText += ("\n" + storedTextStr)
                }
            }
            catch let error{
                print(error)
            }
            print("final text",finalText)
            do {
                try finalText.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch let error{
                print(error)
            }
        }
    }
    
    
    func storePDFInFileManager(){
        if let pdfURL = Bundle.main.url(forResource: "gobt", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = dir.appendingPathComponent("myPDF.pdf")
                    showSavedPdf(url: fileURL.absoluteString, fileName: "myPDF")
                    do {
                        try data.write(to: fileURL, options: .atomicWrite)
                    }
                    catch let error{
                        print(error)
                    }
                }
            }
            catch {
                print(error)
            }
            
        }
    }
    
    func showSavedPdf(url:String, fileName:String) {
        if #available(iOS 10.0, *) {
            do {
                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
                for url in contents {
                    if url.description.contains("\(fileName).pdf") {
                        // its your file! do what you want with it!
                        print("pdf url",url)
                    }
                }
            } catch {
                print("could not locate pdf file !!!!!!!")
            }
        }
    }
    
}

struct FileManagerView: View {
    
    @StateObject var fvm = FileManagerViewModel()
    
    var body: some View {
        VStack{
            if let image = fvm.image{
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 4))
                    .shadow(radius: 10)
                    .frame(width: 200, height: 200, alignment: .leading)
            }
            
            CapsuleButton(text: "Save Image", backgroundColor: .red, textColor: .black) {
                fvm.saveImage(name: "v")
            }
            
            CapsuleButton(text: "Get Image", backgroundColor: .green, textColor: .black) {
                fvm.getImage(name: "v")
            }
            
            CapsuleButton(text: "Delete Image", backgroundColor: .yellow, textColor: .black) {
                fvm.deleteImage(name: "v")
            }
        }
    }
}

struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}
