//
//  CollectionView.swift
//  UnsplashV2.0
//
//  Created by Nikita on 04/01/2020.
//  Copyright © 2020 Nikita. All rights reserved.
//

import Foundation
import UIKit

internal class SearchPhotosCollectionView: UICollectionView {
    
    let flowLayout = UICollectionViewFlowLayout()
    
    init() {
        super.init(frame: .zero,
                   collectionViewLayout: flowLayout)
        backgroundColor = .white
        showsHorizontalScrollIndicator = false
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        register(cellClass: PhotosCell.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

internal class PhotosCell: UICollectionViewCell {
    
    var imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.width.height.equalToSuperview()
        }
    }
}
