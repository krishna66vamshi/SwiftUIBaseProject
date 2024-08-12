//
//  ContentView.swift
//  SwiftUI-List-Starter
//
//  Created by Sean Allen on 4/23/21.
//

import SwiftUI

struct SAView:View{
    
    @State private var selectedTab = 0

    
    var body: some View{
        VStack {
            Picker("What is your favorite screen?", selection: $selectedTab) {
                Text("SAList").tag(0)
                Text("ExpandedList").tag(1)
                Text("CheckboxList").tag(2)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal,50)
            
            if selectedTab == 0{
                ContentView()
            }else if selectedTab == 1{
                ExpandedListView()
            }else{
                CheckBoxList()
            }
        }
    }
}


struct ContentView: View {
    
    var videosArray = VideoList.topTen

    
    var body: some View {
        NavigationView{
            List(videosArray,id:\.id){ video in
                NavigationLink(
                    destination: VideoDetailView(video: video),
                    label: {
                        VideoCell(video: video)
                    })
            }.navigationTitle("Sean's Top 10")
        }
    }
}

struct VideoCell:View {
    
    var video:Video
    
    var body: some View{
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height:70)
                .cornerRadius(4)
                .padding(.vertical,10)
            
            VStack(alignment: .leading,spacing:5){
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
