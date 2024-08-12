//
//  CheckBoxList.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 20/07/22.
//

import SwiftUI

struct TodoList:Identifiable{
    var id = UUID().uuidString
    var name:String
    var isCompleted = false
}

struct CheckBoxList: View {
    
   @State private var todolistArray = [
        TodoList(name: "swiftUI", isCompleted: false),
        TodoList(name: "flutter", isCompleted: false),
        TodoList(name: "Xamarin", isCompleted: false),
        TodoList(name: "Swift", isCompleted: false),
        TodoList(name: "ReadBooks", isCompleted: true),
        TodoList(name: "Play Games", isCompleted: false),

    ]
    
    var body: some View {
        VStack{
            List($todolistArray,id: \.id) { row in
                CheckView(todolist:row)
            }
            Text("All Completed Lists \(todolistArray.filter{$0.isCompleted}.count)")
        }.padding([.bottom],50)
    }
}

struct CheckView: View {
    
    @Binding var todolist:TodoList

    func toggle(){todolist.isCompleted = !todolist.isCompleted}
    var body: some View {
        HStack(spacing:25){
            Image(systemName: todolist.isCompleted ? "checkmark.square" : "square")
                .onTapGesture {
                    toggle()
                }
            Text(todolist.name)
        }
    }
}

struct CheckBoxList_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxList()
    }
}
