//
//  Config.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

internal class Config {
    
    static let shared: Config = Config()
    
    private init() { }
    
    let apiUrl: URL = URL(string: "https://api.unsplash.com/")!
}
