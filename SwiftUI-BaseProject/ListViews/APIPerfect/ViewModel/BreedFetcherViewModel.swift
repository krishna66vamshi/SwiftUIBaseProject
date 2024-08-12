//
//  BreedFetcher.swift
//  BreedFetcher
//
//  Created by Karin Prater on 20.08.21.
//

import Foundation


class BreedFetcherViewModel: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllBreeds()
    }
    
    func fetchAllBreeds() {
        isLoading = true
        errorMessage = nil
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
        APIService.fetch([Breed].self, url: url, completion: { (result) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let breeds):
                    print("--- sucess with \(breeds.count)")
                    self.breeds = breeds
                }
            }
        })
    }
}
