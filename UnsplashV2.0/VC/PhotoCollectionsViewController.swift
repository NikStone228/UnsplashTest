//
//  PhotoCollectionsViewController.swift
//  UnsplashV2.0
//
//  Created by Nikita on 06/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "CellPhotoCollectionID"
    var collectionsId = ""
    
    private var searches: [CollectionIdSearchResult] = []
    private var collectionIDSearchDomain = URL(string: domainAPI)?.appendingPathComponent(collectionsUrlEndPoint)
    private var page = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsPerRow = 3
        params["collections"] = collectionsId
        collectionIDSearchDomain = collectionIDSearchDomain?.appendingPathComponent("/\(collectionsId)/photos/")
        getSearchFromAPI()
    }
}

// MARK: - Applied methods
private extension PhotoCollectionViewController {
    func photo(for indexPath: IndexPath) -> Photo? {
        return searches[indexPath.section].photos[indexPath.row]
    }
}

// MARK: - UICollectionViewDataSource
extension PhotoCollectionViewController {
    
    func getSearchFromAPI(){
        APIService.shared.getObject(url: collectionIDSearchDomain, params: params){
            [weak self] (result: Swift.Result<[Photo], Error>) in
            do {
                let result = try result.get()
                let searchResults = CollectionIdSearchResult(photos: result)
                self?.searches.append(searchResults)
                self?.collectionView.reloadData()
            } catch(let error ) {
                print("\(error)")
            }
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return searches.count
    }
  
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches[section].photos.count
    }
  
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,for: indexPath) as! CollectionIdCollectionViewCell
        let currentPhoto = photo(for: indexPath)
        cell.backgroundColor = .white
        cell.imageView.loadPhoto(currentPhoto?.urls?.thumb.absoluteString ?? "", isAnimation: false)
        return cell
    }

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let diffHeight = contentHeight - contentOffset
        let frameHeight = scrollView.bounds.size.height
        let pullHeight  = abs(diffHeight - frameHeight)
        if pullHeight < 0.2 {
            print("load more..")
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateNextSet), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateNextSet(){
        page += 1
        params["page"] = "\(page)"
        getSearchFromAPI()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        performSegue(withIdentifier: "collectionPhotoIdDetailsSegue", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC: DetailViewController = segue.destination as? DetailViewController {
            if let index = collectionView.indexPathsForSelectedItems?.first {
                let currentPhoto = searches[index.section].photos[index.row]
            }
        }
    }
}
