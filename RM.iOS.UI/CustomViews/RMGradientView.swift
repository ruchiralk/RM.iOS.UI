//
//  RMGradientLayerView.swift
//  Pods-RM.iOS.UI_Tests
//
//  Created by Ruchira Munidasa on 07/08/2019.
//

import UIKit

class RMGradientView: UIView {
    
    override public class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }

    public var colors: [CGColor]? {
        didSet {
            let gradientLayer = self.layer as? CAGradientLayer
            gradientLayer?.colors = colors
        }
    }
    
    public var startPoint: CGPoint {
        didSet {
            let gradientLayer = self.layer as? CAGradientLayer
            gradientLayer?.startPoint = startPoint
        }
    }
    
    public var endPoint: CGPoint {
        didSet {
            let gradientLayer = self.layer as? CAGradientLayer
            gradientLayer?.startPoint = endPoint
        }
    }
    
    public var locations: [NSNumber]? {
        didSet {
            let gradientLayer = self.layer as? CAGradientLayer
            gradientLayer?.locations = locations
        }
    }
    
    override init(frame: CGRect) {
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        super.init(coder: aDecoder)
    }
    
}
