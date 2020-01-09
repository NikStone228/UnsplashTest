//
//  DataFetcher.swift
//  UnsplashV2.0
//
//  Created by Nikita on 03/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

class DataFetcher {
    
    var nwService = NwService()
    
    func fetchImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        nwService.request(searchTerm: searchTerm) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    
}
