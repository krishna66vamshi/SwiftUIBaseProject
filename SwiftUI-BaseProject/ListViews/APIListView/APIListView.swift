//
//  APIListView.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 26/06/22.
//

import SwiftUI

struct APIListView: View {
    
    @StateObject var viewModel = FeedViewModel()
    @StateObject var internetConnection = InternetConnection()
    @State var newItem = ""

    
    var body: some View {
        //Here without creating if else if we can use ZStack , bcos place view on top of one another
        if !internetConnection.isConnected{
            Text("No Internet Connection")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
        }else if viewModel.isLoading {
            LoadingView()
        }else if viewModel.errorMessage != nil  {
            //error
            Text(viewModel.errorMessage ?? "")
                .font(.largeTitle)
                .fontWeight(.bold)
        }else if viewModel.results.count == 0 {
            Text("No records found")
                .font(.largeTitle)
                .fontWeight(.bold)
        }else {
            List{
                searchBar.padding(10)

                Section(header:
                            Text("Section 1")
                    .foregroundColor(.green)
                    .font(Font.custom("EduNSWACTFoundation-Bold", size: 25))
                ) {
                    ForEach(viewModel.results){ obj in
                        ResultsCell(feedResult: obj)
                    }.onDelete(perform: { indexSet in
                        viewModel.results.remove(atOffsets: indexSet)
                    }).onMove(perform: { indices, newOffset in
                        viewModel.results.move(fromOffsets: indices, toOffset: newOffset)
                    })
                }
                .headerProminence(.increased)
                
                Section(header: Text("Section 2").font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)) {
                        ForEach(viewModel.results){ obj in
                            Text("Section 2 \(obj.name)")
                        }
                    }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Most played songs")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: EditButton())
            .refreshable {
                let obj = FeedResult(id: UUID().uuidString, name: "newItem", artistName: "demo name", artworkUrl100: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg")
                viewModel.results.append(obj)
//                viewModel.fetchAllMusicData()
            }
        }
    }

    
    var searchBar:some View{
        HStack{
            TextField("Enter new item", text: $newItem)
            Button(action: {
                if !newItem.isEmpty{
                    let obj = FeedResult(id: UUID().uuidString, name: newItem, artistName: "demo name", artworkUrl100: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg")
                    viewModel.results.append(obj)
                    newItem = ""
                }
            }, label: {
                Text("Add New Item")
            })
        }
    }
}


struct ResultsCell:View {
    
    var feedResult:FeedResult
    let imageSize: CGFloat = 100
    
    var body: some View{
        HStack{
            if feedResult.artworkUrl100 != "" {
                ReusableAsyncImage(imageUrl: feedResult.artworkUrl100)
            }else{
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading,spacing:5){
                Text(feedResult.artistName)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(feedResult.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
        )
    }
}

struct APIListView_Previews: PreviewProvider {
    static var previews: some View {
        APIListView()
    }
}
