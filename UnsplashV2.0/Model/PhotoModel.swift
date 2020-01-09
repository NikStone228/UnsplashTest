//
//  PhotoModel.swift
//  UnsplashV2.0
//
//  Created by Nikita on 06/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation

public struct Photo: Codable {
    
    public let width: UInt32?
    public let height: UInt32?
    public let description: String?
    public let urls: PhotoURL?
    
    private enum CodingKeys: String, CodingKey {
        case width
        case height
        case description
        case urls
    }

}
