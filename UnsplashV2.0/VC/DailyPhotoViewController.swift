//
//  DailyPhotoViewController.swift
//  UnsplashV2.0
//
//  Created by Nikita on 03/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import UIKit

class DailyPhotoViewController: UIViewController {
    var dailyLabel:UILabel!
    let homeURL = "https://unsplash.com"
    let sourceURL = "https://source.unsplash.com/"
    let dailyText = "Photo of the Day"
    @IBOutlet var dailyPhoto: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        getDailyPhoto()
    }
    
    private func setupNavigationBar() {
        dailyLabel = UILabel(frame: CGRect(x:0, y: 200, width: 300, height: 100))
               dailyLabel.text = "Photo of the Day"
               dailyLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
               dailyLabel.textColor = #colorLiteral(red: 0.5019607843, green: 0.4980392157, blue: 0.4980392157, alpha: 1)
                navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: dailyLabel)
    }
    
    func getDailyPhoto(){
         NetworkService.shared.parsingStringFromHTML(url: URL(string: homeURL), filterText: dailyText){
             [weak self](result: Swift.Result<[String], Error>) in
             do {
                 if let result = try result.get().first {
                     let idPhotoOfDay = result.deletingPrefix("/photos/")
                    let resultURLString = (self?.sourceURL ?? "") + idPhotoOfDay
                    self?.dailyPhoto.loadPhoto(resultURLString, isAnimation: false)
                     }
             } catch (let error)  {
                 print("\(error)")
             }
         }
     }
}

extension UIImageView {
    func loadPhoto(_ url: String, isAnimation: Bool) {
        let photoUrl = URL(string: url)
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
            DispatchQueue.main.async {
                if let data = try? Data(contentsOf: photoUrl!), let image = UIImage(data: data) {
                    self.image = image
                }
                    
            }
        }
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
