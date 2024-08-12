//
//  NetworkManager.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 26/06/22.
//

import SwiftUI

class FeedViewModel:ObservableObject{
    
    @Published var results:[FeedResult] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchAllMusicData()
    }
    
    func fetchAllMusicData() {
        isLoading = true
        errorMessage = nil
        let urlStr = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        let url = URL(string: urlStr)
        APIService.fetch(FeedModel.self, url: url, completion: { (result) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let resp):
                    print("--- resp is \(resp)")
                    self.results = resp.feed.results
                }
            }
        })
    }
}
