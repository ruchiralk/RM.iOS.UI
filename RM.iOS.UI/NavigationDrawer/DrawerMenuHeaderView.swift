//
//  DrawerMenuHeaderView.swift
//  RM.iOS.Core
//
//  Created by Ruchira Munidasa on 05/07/2019.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class DrawerMenuHeaderView: UIView {
    
    public let title: UILabel
    public let rightImageView: UIImageView
    let titleOffset: CGFloat
    let rightIconWidth: CGFloat
    
    public init(titleOffset: CGFloat, rightIconWidth: CGFloat, frame: CGRect) {
        title = UILabel(frame: CGRect.zero)
        rightImageView = UIImageView(frame: CGRect.zero)
        self.titleOffset = titleOffset
        self.rightIconWidth = rightIconWidth
        super.init(frame: frame)
        configureLayout()
        configureTheme()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureTheme(){
        rightImageView.contentMode = .scaleAspectFit
        
        title.textAlignment = .left
        title.textColor = UIColor.white
        title.font = UIFont.systemFont(ofSize: 14.0)
    }
    
    open func configureLayout(){
        self.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: titleOffset).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.addSubview(rightImageView)
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0).isActive = true
        rightImageView.widthAnchor.constraint(equalToConstant: rightIconWidth).isActive = true
        rightImageView.heightAnchor.constraint(equalToConstant: rightIconWidth).isActive = true
        rightImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
