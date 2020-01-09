//
//  APIService.swift
//  UnsplashV2.0
//
//  Created by Nikita on 06/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

struct CustomError: Error, Decodable {
    var errors: [String?]
}

final public class APIService {
    
    public static let shared = APIService()
    
    func getObject<T:Decodable>(
        url: URL?,
        params: Parameters,
        handler: @escaping (Swift.Result<T, Error>) -> Void) {
        if let resultURL = url {
            request(resultURL, method: .get, parameters: params).responseData(){ response in
                    response.result.withValue { data in
                        do {
                            if let responseError = response.response?.statusCode {
                                if responseError != 200 {
                                        let error = try JSONDecoder.init().decode(CustomError.self, from: data)
                                        handler(.failure(error))
                                        return
                                    } else {
                                        let result = try JSONDecoder.init().decode(T.self, from: data)
                                        handler(.success(result))
                                        return
                                    }
                                }
                        } catch (let error) {
                            handler(.failure(error))
                            return
                        }
                    }.withError { error in
                        handler(.failure(error))
                    }
            }
        }

    }
}
