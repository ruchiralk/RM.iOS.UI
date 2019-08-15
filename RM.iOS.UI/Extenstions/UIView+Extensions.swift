//
//  UIView+Extensions.swift
//  Pods-RM.iOS.UI_Tests
//
//  Created by Ruchira Munidasa on 07/08/2019.
//

import UIKit

extension UIView {
    public func addGradientBackground(colors: [CGColor], startPoint: CGPoint = CGPoint(x: 0,y: 0), endPoint: CGPoint = CGPoint(x: 1,y: 0)){
        let gradientView = RMGradientView(frame: CGRect.zero)
        gradientView.colors = colors
        gradientView.startPoint = startPoint
        gradientView.endPoint = endPoint
        self.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        gradientView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

