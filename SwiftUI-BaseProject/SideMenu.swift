//
//  SideMenu.swift
//  SwiftUISideMenu
//
//  Created by Hyper Thread Solutions on 17/07/22.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu:Bool
    @State private var isShowingPushPresent = false

    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            VStack(alignment: .leading, spacing: 12){
                
                Image("v")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("Virat Kohli")
                    .font(.title2.bold())
                
                
                Text("Cricketer")
                    .font(.callout)
                
                HStack(spacing:12){
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("100")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Following")
                        } icon: {
                            Text("2.5M ")
                                .fontWeight(.bold)
                        }
                    }
                    
                }
                .foregroundColor(.primary)
                
                
            }
            .padding(.horizontal)
            .padding(.leading)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 45) {
                    
                    TabButton(title: "Profile", image: "person.crop.circle")
                    
                    TabButton(title: "Chats", image: "message.fill")
                    
                    TabButton(title: "Settings", image: "gear")
                    
                    NavigationLink(destination: BaseView(currentTab:"bell"), isActive: $isShowingPushPresent) {
                        CapsuleButton(text: "Notifications",backgroundColor: .black,textColor: .white) {
                            self.isShowingPushPresent.toggle()
                        }
                    }
                }
                .padding()
                .padding(.leading)
                .padding(.top,35)
                
            }
            
            
        }
        .padding(.vertical)
        .frame(maxWidth:.infinity,alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            
            Color.primary.opacity(0.04).ignoresSafeArea(.container, edges: .vertical)
            
        )
        .frame(maxWidth:.infinity,alignment: .leading)
        
    }
    
    @ViewBuilder
    func TabButton(title:String,image:String) -> some View{
        
        
        NavigationLink {
            Text("\(title) View")
                .navigationTitle(title)
            
        } label: {
            HStack(spacing:14){
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth:.infinity,alignment: .leading)
        } 
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    
}
