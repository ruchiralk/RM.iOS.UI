//
//  RMBorderedImageView.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class RMBorderImageView : UIImageView {

    public var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    public var borderWidth: CGFloat? {
        didSet {
            self.layer.borderWidth = borderWidth ?? 0
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
