//
//  RMViewWithDashedBorder.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

protocol RMViewWithDashedBorder where Self : UIView {
    var dashedBorder: CAShapeLayer { get }
}

extension RMViewWithDashedBorder {

    public var borderColor: UIColor {
        return UIColor(red: 210.0/255, green: 210.0/255, blue: 210.0/255, alpha: 1.0)
    }
    
    func initializeDashedBorder(){
        dashedBorder.fillColor = nil
        dashedBorder.lineDashPattern = [4, 2]
        dashedBorder.strokeColor = borderColor.cgColor
        self.layer.addSublayer(dashedBorder)
    }
    
    func layoutDashedBorder() {
        dashedBorder.path = UIBezierPath(rect: self.bounds).cgPath
        dashedBorder.frame = self.bounds
    }

}
