//
//  PhotosCollectionViewManager.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//
import UIKit
import Kingfisher

internal class PhotosCollectionManager: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images: [API.Photos.Photo] = []
    
    var imageTap: ((API.Photos.Photo) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if images.isEmpty {
            collectionView.isHidden = true
        } else {
            collectionView.isHidden = false
        }
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: PhotosCell.self, forIndexPath: indexPath)

        let image = images[indexPath.row]
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: URL(string: image.urls.full))
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        imageTap?(image)
    }
    
}
