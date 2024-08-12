//
//  APIPerfectListView.swift
//  SwiftUI-BaseProject
//
//  Created by vamsi on 26/06/22.
//

import SwiftUI

struct APIPerfectListView: View {
    @StateObject var breedFetcher = BreedFetcherViewModel()
    var body: some View {
        if breedFetcher.isLoading {
            LoadingView()
        }else if breedFetcher.errorMessage != nil  {
            ErrorView(breedFetcher: breedFetcher)
        }else {
            BreedListView(breeds: breedFetcher.breeds)
        }
    }
}

struct APIPerfectListView_Previews: PreviewProvider {
    static var previews: some View {
        APIPerfectListView()
    }
}
