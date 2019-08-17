//
//  RMAvailableBidsCollectionViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI

class RMAvailableBidsCollectionViewController : RMVerticalListCollectionViewController {
    
    private let cellIdentifer = "cellIdentifier"
    
    enum CollectionViewDisplayMode {
        case compact
        case expanded
    }
    
    var displayMode = CollectionViewDisplayMode.expanded {
        didSet {
            switch displayMode {
            case .compact:
                collectionView.isScrollEnabled = false
            case .expanded:
                collectionView.isScrollEnabled = true
            }
        }
    }
    
    var itemCountVisibleInCompactMode = 3
    
    var heightForCompactMode: CGFloat {
        return itemHeight
    }
    
    var viewHeightInCompactMode: CGFloat {
        return itemHeight * CGFloat(itemCountVisibleInCompactMode) + lineSpacing * CGFloat(itemCountVisibleInCompactMode - 1)
    }
    
    override var itemHeight: CGFloat {
        return 60
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(RMItemValueCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifer)
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.white
    }

}

extension RMAvailableBidsCollectionViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath)
        return cell
    }
    
}
