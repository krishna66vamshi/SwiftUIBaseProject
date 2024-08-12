//
//  PushPresent.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 12/07/22.
//

import SwiftUI

/*
 
 Presenting Multiple Sheets in single screen
 
 
 common pitfalls
 //We should use only one sheet
 //If we write .sheets to both parent and child ; it will ignore child .sheets
 
 1.we shouldn't write if condition in sheet content bcos it calls as soon as view loads , so for first click it(sheet content) will not work but from second time onwards it will work.But this is buggy it's not useful
 Ex:- BAD CODE
 @State private var isShowingPresent = false
 @State var selectedScreen = 0
 
 VStack{
 CapsuleButton(text: "Present 1",backgroundColor: .pink,textColor: .black) {
 
 self.isShowingPresent.toggle()
 self.selectedIndex = 0
 
 }
 
 CapsuleButton(text: "Present 2",backgroundColor: .pink,textColor: .black) {
 self.isShowingPresent.toggle()
 self.selectedIndex = 1
 }
 
 }.sheet(isPresented: $isShowingPresent) {
 if selectedIndex == 0{
 //open first screen
 }else if selectedIndex == 1{
 //open second screen
 }else{
 Detailed_View(isFrom: "Present",name:$name)
 }
 }
 
 Three ways:-
 //1- binding
 //2 - using multiple .sheets in every button action
 //3 - using $items => mostly used in realtime
 
 
 */

enum ActiveSheet: Identifiable {
    case first, second
    
    var id: Int {
        hashValue
    }
}

struct PushPresent: View {
    
    @State private var isShowingScreen1 = false
    @State private var isShowingScreen2 = false
    @State private var isShowingPush = false
    @State private var name = ""
    @State var activeSheet: ActiveSheet?
    
    
    
    var body: some View {
        VStack{
            
            firstApproachOfPresentingMultipleSheets
            itemsApproachOfPresentingMultipleSheets
            
            NavigationLink(destination: Detailed_View(isFrom: "Push",name:$name), isActive: $isShowingPush) {
                CapsuleButton(text: "Push",backgroundColor: .pink,textColor: .black) {
                    self.isShowingPush.toggle()
                }
            }
            
            Text(name)
                .font(.body)
                .fontWeight(.bold)
            
        }
    }
    
    @ViewBuilder
    var firstApproachOfPresentingMultipleSheets:some View{
        
        VStack(spacing:20){
            Divider()
            Text("Using multiple .sheets in every button action Approach")
                .font(.body)
                .fontWeight(.bold)
            
            CapsuleButton(text: "Present Screen1",backgroundColor: .pink,textColor: .black) {
                self.isShowingScreen1.toggle()
            }.sheet(isPresented: $isShowingScreen1) {
                Screen1(name: "Screen 1")
            }
            
            CapsuleButton(text: "Present Screen2",backgroundColor: .black,textColor: .white) {
                self.isShowingScreen2.toggle()
            }.sheet(isPresented: $isShowingScreen2) {
                Screen2(name: "Screen 2")
            }
            Divider()
            
        }.padding()
    }
    
    @ViewBuilder
    var itemsApproachOfPresentingMultipleSheets:some View{
        
        VStack(spacing:20){
            Divider()
            Text("ItemsApproach")
                .font(.body)
                .fontWeight(.bold)
            
            CapsuleButton(text: "Present Screen1",backgroundColor: .green,textColor: .black) {
                activeSheet = .first
            }
            
            CapsuleButton(text: "Present Screen2",backgroundColor: .cyan,textColor: .black) {
                activeSheet = .second
            }
            
            Divider()
        }
        .padding()
        .sheet(item: $activeSheet) { item in
            switch item {
            case .first:
                Screen1(name: "Screen 1")
            case .second:
                Screen2(name: "Screen 2")
            }
        }
    }
}

struct Screen1:View{
    var name:String
    
    var body:some View{
        Text(name)
            .font(.body)
            .fontWeight(.bold)
    }
}

struct Screen2:View{
    var name:String
    
    var body:some View{
        Text(name)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.black)
    }
}


struct Detailed_View: View {
    
    @Environment(\.presentationMode) var presentationMode
    var isFrom:String
    @Binding var name:String
    
    @State var enteredText = ""
    
    var body: some View {
        VStack{
            
            TextField("enter text", text: $enteredText).textFieldStyle(RoundedBorderTextFieldStyle())
            
            CapsuleButton(text: isFrom == "Present" ? "Dismiss" : "Pop",backgroundColor: .pink,textColor: .black) {
                name = enteredText
                presentationMode.wrappedValue.dismiss()
            }
        }
        
    }
}

struct PushPresent_Previews: PreviewProvider {
    static var previews: some View {
        PushPresent()
    }
}
