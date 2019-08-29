//
//  SampleVerticalListCollectionViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/16/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI

class SampleVerticalListCollectionViewController: RMVerticalListCollectionViewController {

    private let cellReuseIdentifier = "cellReuseIdentifier"
    
    override var itemHeight: CGFloat {
        return 380
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        self.collectionView.register(RMProductCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = UIColor.white
    }

}

extension SampleVerticalListCollectionViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? RMProductCollectionViewCell
        cell?.backgroundColor = .white
        cell?.titleLabel.text = "Gold Ring"
        return cell!
    }
    
    
}
