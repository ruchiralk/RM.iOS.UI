//
//  RMItemValueCollectionViewCell.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class RMItemValueCollectionViewCell: UICollectionViewCell, RMViewWithDashedBorder {
    
    let dashedBorder: CAShapeLayer = CAShapeLayer()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initializeDashedBorder()
        self.backgroundColor = .white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutDashedBorder()
    }
}
