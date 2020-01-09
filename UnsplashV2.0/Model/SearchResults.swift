//
//  SearchResults.swift
//  UnsplashV2.0
//
//  Created by Nikita on 06/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

struct SearchResults {
  let searchTerm: String?
  let searchResults: Search?
  let collections: [Collection?]
}

struct CollectionIdSearchResult {
    let photos: [Photo]
}
