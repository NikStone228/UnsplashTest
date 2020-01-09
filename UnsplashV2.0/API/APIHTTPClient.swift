//
//  APIHTTPClient.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import Alamofire
import Foundation

internal protocol APIHTTPClient: class {
    func request<E: APIEndpoint>(_ endpoint: E, completion: @escaping (AFResult<E.Response>) -> Void)
}

internal class APIHTTPClientImpl: APIHTTPClient {
    
    // MARK: - Properties
    
    private let baseUrl: URL
    
    // MARK: - Init
    
    init(baseUrl: URL) {
        self.baseUrl = baseUrl
    }
    
    // MARK: - APIClient
    
    func request<E: APIEndpoint>(_ endpoint: E, completion: @escaping (AFResult<E.Response>) -> Void) {
        
        let url = baseUrl.appendingPathComponent(endpoint.path)
        
        AF.request(url, method: endpoint.method, parameters: endpoint.parameters, encoding: endpoint.encoding, headers: endpoint.headers).validate().responseDecodable { (response: AFDataResponse<E.Response>) in
            
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
}
