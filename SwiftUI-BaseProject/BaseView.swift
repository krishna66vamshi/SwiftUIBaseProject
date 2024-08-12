//
//  BaseView.swift
//  SwiftUISideMenu
//
//  Created by Hyper Thread Solutions on 17/07/22.
//

import SwiftUI

struct BaseView: View {
    
    
    @State var showMenu = false
    @State var currentTab = "house"
    @State var offSet:CGFloat = 0
    @State var lastStoredOffSet:CGFloat = 0
    @GestureState var gestureOffSet:CGFloat = 0

    
//    init() {
////        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        
        NavigationView{
            
            HStack(spacing:0){
                
                SideMenu(showMenu: $showMenu)
                
                VStack(spacing:20){
                    TabView(selection: $currentTab){
                        
                        AtomicTasks(showMenu: $showMenu)
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house")
                        
                        APIPerfectListView()
                            .tabItem {
                                Label("List", systemImage: "list.bullet")
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("magnifyingglass")
                        
                        SAView()
                            .tabItem {
                                Label("Notifications", systemImage: "bell")
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("bell")
                        
                       CoreDataView()
                            .tabItem {
                                Label("CoreData", systemImage: "square.stack.3d.up.fill")
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("message.fill")
                        
                    }
                    
                    //Custom Tab bar

//                    VStack(spacing:0){
//
//                        Divider()
//
//                        HStack(spacing:0){
//                            TabButton(image: "house")
//                            TabButton(image: "magnifyingglass")
//                            TabButton(image: "bell")
//                            TabButton(image: "message.fill")
//
//                        }
//                        .padding([.top],15)
//
//                    }
                }
                .frame(width: getRect().width)
                
                //BG When Menu is showing
                
                .overlay(
                Rectangle()
                    .fill(
                        Color.primary
                            .opacity(Double((offSet/sideBarWidth)/5))
                        
                    )
                    .ignoresSafeArea(.container, edges: .vertical)
                    .onTapGesture(perform: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    })
                
                
                )
                
            }
            .frame(width:getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth/2)
            .offset(x:offSet > 0 ? offSet : 0)
            .gesture(
                DragGesture().updating($gestureOffSet, body: { value, out, _ in
                    out = value.translation.width
                })
                .onEnded(onEnd(value:))
            
            
            )
            
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            
        }
        .animation(.easeOut, value: offSet == 0)
        .onChange(of: showMenu) { newValue in
            
            if showMenu && offSet == 0{
                offSet = sideBarWidth
                lastStoredOffSet = offSet
            }
            
            if !showMenu && offSet == sideBarWidth{
                offSet = 0
                lastStoredOffSet = 0
            }
     
        }
        
        .onChange(of: gestureOffSet) { newValue in
           onChange()
        }
    }
    
    func onChange(){
        let sideBarWidth = getRect().width - 90
        offSet = (gestureOffSet != 0) ?  (gestureOffSet + lastStoredOffSet < sideBarWidth ? gestureOffSet + lastStoredOffSet : offSet) : offSet
        
        
        
    }
    
    func onEnd(value:DragGesture.Value){
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation {
            
            if translation > 0{
                
                if translation > (sideBarWidth/2){
                    offSet = sideBarWidth
                    showMenu = true
                }else{
                    
                    
                    if offSet == sideBarWidth {
                        return
                    }
                    
                    offSet = 0
                    showMenu = false
                }
                
                
            }else{
                
                if -translation > (sideBarWidth/2){
                    offSet = 0
                    showMenu = false
                }else{
                    
                    if offSet == 0 || !showMenu{
                        return
                    }
                    
                    
                    offSet = sideBarWidth
                    showMenu = true
                }
                
            }
            
        }
        
        
        
        
        lastStoredOffSet = offSet

    }
    
    @ViewBuilder
    func TabButton(image:String) -> some View{
        
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 22)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth:.infinity)
        }

        
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
