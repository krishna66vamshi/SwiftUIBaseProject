//
//  SwiftUIView.swift
//  SwiftUI-BaseProject
//
//  Created by Hyper Thread Solutions on 23/07/22.
//

import SwiftUI
import CoreData


struct CoreDataView: View {
    
    @StateObject var coreDataManager = CoreDataManager()
    @State private var newMovieTitle: String = ""
    @State private var needsRefresh: Bool = false
    @State private var isShowingCreateMovie: Bool = false

    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                List {
                    ForEach(coreDataManager.allMoviesArray) { movie in
                        NavigationLink(destination:CreateMovie(needsRefresh: $needsRefresh,isFromEdit: true, movieObj:movie)) {
                            MovieRow(movieObj: movie)
                        }
                    }
                    .onDelete(perform: coreDataManager.deleteMovie(indexSet:))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination:CreateMovie(needsRefresh: $needsRefresh,isFromEdit: false,movieObj: MovieEntity()),isActive: $isShowingCreateMovie) {
                        Button {
                            self.isShowingCreateMovie.toggle()
                        } label: {
                            Text("Add Movie")
                        }
                    }
                }
            }
            .refreshable {
                coreDataManager.fetchAllMovies()
            }
            .onAppear {
                if needsRefresh{
                    coreDataManager.fetchAllMovies()
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
//            .fullScreenCover(isPresented: $isShowingCreateMovie, content: {
//                CreateMovie(needsRefresh: $needsRefresh)
//            })
//            .sheet(isPresented: $isShowingCreateMovie) {
//                CreateMovie(needsRefresh: $needsRefresh)
//            }
        }
    }
}
