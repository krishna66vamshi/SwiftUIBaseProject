//
//  CoreDataManager.swift
//  SwiftUI-CoreData
//
//  Created by Hyper Thread Solutions on 23/07/22.
//

import Foundation
import CoreData

class CoreDataManager:ObservableObject{
    
    let container:NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    @Published var allMoviesArray:[MovieEntity] = []
    
    init(){
        container =  NSPersistentContainer(name: "SwiftUI-BaseProject")
        container.loadPersistentStores { description, err in
            if let err = err {
                print("Error loading coredata \(err)")
            }else{
                print("Coredata setup successfully")
            }
        }
        fetchAllMovies()
    }
    
    func fetchAllMovies(){
        let request = MovieEntity.fetchRequest()
//        request.fetchOffset = 0
//        request.fetchLimit = 10
        request.sortDescriptors = [NSSortDescriptor(key: "createdDate", ascending: false)]
        do{
            allMoviesArray = try container.viewContext.fetch(request)
        }catch let err{
            print("ERROR WHILE FETCHING \(err.localizedDescription)")
        }
    }
    
    func saveMovie(title:String,imgData:Data,createdDate:Date){
        let movie = MovieEntity(context: container.viewContext)
        movie.title = title
        movie.image = imgData
        movie.createdDate = createdDate
        saveContext()
    }
    
    func deleteMovie(indexSet:IndexSet){
        guard let index = indexSet.first else {return}
        let movie = allMoviesArray[index]
        container.viewContext.delete(movie)
        saveContext()
    }
    
    func updateMovie(){
        saveContext()
    }
    
    func saveContext(){
        do{
            try container.viewContext.save()
            fetchAllMovies()
        }catch let err{
            print("ERROR WHILE SAVING \(err.localizedDescription)")
        }
    }
    
}
