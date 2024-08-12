//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by Brian Voong on 2/15/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import Foundation

struct FeedModel: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Identifiable,Decodable {
    let id, name, artistName, artworkUrl100: String
}
