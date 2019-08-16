//
//  RMVerticalListCollectionViewController.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/16/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class RMVerticalListCollectionViewController: RMCollectionViewController {

    public var itemHeight: CGFloat {
        return 80.0
    }
    
    public var itemWidth: CGFloat {
        return self.view.bounds.width
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    public override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemWidth, height: itemHeight)
    }

}
