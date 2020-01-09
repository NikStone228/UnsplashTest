//
//  Constant.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import UIKit


enum Storyboard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
}

enum ViewControllers: String {
    case searchViewController = "SearchViewController"
    case resultViewController = "ResultViewController"
    case detailViewController = "DetailViewController"
    
    func instance(fromStoryboard storyBoard: UIStoryboard) -> UIViewController {
        return storyBoard.instantiateViewController(withIdentifier: self.rawValue)
        
    }
}
