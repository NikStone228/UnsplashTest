//
//  SerachViewController.swift
//  UnsplashV2.0
//
//  Created by Nikita on 03/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


class SearchViewController: UIViewController {
    
    let httpClient: APIHTTPClient = APIHTTPClientImpl(baseUrl: Config.shared.apiUrl)
    
    var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.returnKeyType = .search
        sb.placeholder = "Введите запрос..."
        return sb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        searchBar.delegate = self
        view.addSubview(searchBar)
        makeConstraints()
    }
    
    private func makeConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(40.0)
            make.top.equalToSuperview().offset(64.0)
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        httpClient.request(API.Photos.getPhotosWith(query: text)) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let fail):
                print(fail)
            case .success(let value):
                let photos = value.results
                print(photos)
                let vc = ViewControllers.resultViewController.instance(fromStoryboard: Storyboard.main.instance) as! ResultViewController
                vc.photos = photos
                vc.title = text
                strongSelf.show(vc, sender: nil)
            }
        }
    }
}

