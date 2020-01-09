//
//  CollectionsModel.swift
//  UnsplashV2.0
//
//  Created by Nikita on 06/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//


import Foundation

public struct Collection: Codable {
    
    public let id: UInt32
    public var title: String
    public let coverPhoto: Photo?
    public let urls: PhotoURL?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case coverPhoto = "cover_photo"
        case urls
    }
    
}
