//
//  APIError.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

internal enum APIError: Error {
    case network(Error)
    case decoding(Error)
    case invalidResponse
    case uncurrectData
}
