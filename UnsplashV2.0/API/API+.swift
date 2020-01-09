//
//  API+.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

public enum API {
    enum Photos {
        
        struct Results: Decodable {
            let results: [Photo]
        }
        
        struct Photo: Decodable {
            let urls: ImageUrls
        }
        
        struct ImageUrls: Decodable {
            let full: String
        }
        
        static func getPhotosWith(query: String) -> APITask<Results> {
            return APITask(path: "search/photos",
                           method: .get,
                           parameters: ["query": "\(query)"],
                           headers: ["Authorization": "Client-ID 76274ab51aa4d0064b71ee883a368f0d268f121387b9930b71f55929eb7da4b0"])
        }
        
    }
}
