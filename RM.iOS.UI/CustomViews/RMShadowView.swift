//
//  ShadowView.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import SnapKit

class RMShadowView: UIView {

    private init(radius: CGFloat, color: UIColor, offset: CGSize,opacity: Float, shouldRasterize: Bool) {
        super.init(frame: .zero)
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shouldRasterize = shouldRasterize // raterize to stop recalculations
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    override func layoutSubviews() {
        layer.shadowPath = UIBezierPath.init(rect: self.bounds).cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func addShadow(toView parent: UIView, radius: CGFloat, color: UIColor, offset: CGSize,opacity: Float, shouldRasterize: Bool = true){
        let view = RMShadowView(radius: radius, color: color, offset: offset, opacity: opacity, shouldRasterize: shouldRasterize)
        parent.addSubview(view)
        parent.sendSubviewToBack(view)
        view.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
