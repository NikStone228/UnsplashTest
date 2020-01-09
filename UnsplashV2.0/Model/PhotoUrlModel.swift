//
//  PhotoUrlModel.swift
//  UnsplashV2.0
//
//  Created by Nikita on 06/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

public struct PhotoURL: Codable {
    
    public let raw: URL
    public let full: URL
    public let regular: URL
    public let small: URL
    public let thumb: URL
    public let custom: URL?
}
