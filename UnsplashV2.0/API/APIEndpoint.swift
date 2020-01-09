//
//  APIEndpoint.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import Alamofire

internal protocol APIEndpoint {
    
    associatedtype Response: Decodable
    
    var path: String { get }
    
    var headers: HTTPHeaders? { get }
    
    var parameters: Parameters? { get }
    
    var encoding: ParameterEncoding { get }
    
    var method: HTTPMethod { get }
}
