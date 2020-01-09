//
//  NetworkService.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

final public class NetworkService {
    
    public static let shared = NetworkService()
    
    func parsingStringFromHTML(
        url: URL?,
        filterText: String,
        handler: @escaping (Swift.Result<[String], Error>) -> Void){
        if let resultUrl = url {
            let URLTask = URLSession.shared.dataTask(with: resultUrl){
                data, response, error in
                do {
                    if let dataSource = data {
                        if let sourceHTMLString = String(data: dataSource, encoding: String.Encoding.utf8){
                            let doc = try HTML(html: sourceHTMLString, encoding: .utf8)
                            var resultStringArray: [String] = []
                            for link in doc.xpath("//a | //link") {
                                if let text = link.text  {
                                    if text == filterText{
                                        if let filteredString = link["href"]{
                                            resultStringArray.append(filteredString)
                                        }
                                        
                                    }
                                }
                                
                            }
                            handler(.success(resultStringArray))
                        }
                    }
                    
                } catch (let error) {
                    handler(.failure(error))
                }
                
            }
            URLTask.resume()
        }
    
    }
    
}
