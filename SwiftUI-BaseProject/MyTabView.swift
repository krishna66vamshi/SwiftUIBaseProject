//
//  MyTabView.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 25/06/22.
//

import SwiftUI

struct MyTabView: View {
    
   @State var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            AtomicTasks(showMenu: .constant(false))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }.tag(0)
            
            APIPerfectListView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }.tag(1)
            
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }.tag(2)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
