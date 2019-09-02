//
//  RMShadowImageView.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import SnapKit

open class RMShadowImageView: UIView, RMInitializeView {
    
    private let shadowColor: UIColor
    private let radius: CGFloat
    private let offset: CGSize
    private let opacity: Float
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let contentView: UIView = {
       let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    open override var contentMode: ContentMode {
        didSet {
            imageView.contentMode = contentMode
        }
    }
    
    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    open override var backgroundColor: UIColor? {
        didSet {
            contentView.backgroundColor = backgroundColor
            imageView.backgroundColor = backgroundColor
        }
    }
    
    public init(frame: CGRect, shadowColor: UIColor = UIColor(red: 240.0/255, green: 240.0/255, blue: 240.0/255, alpha: 1.0), radius: CGFloat = 1, offset: CGSize = .zero, opacity:Float = 1) {
        self.shadowColor = shadowColor
        self.radius = radius
        self.offset = offset
        self.opacity = opacity
        super.init(frame: frame)
        configureItems()
        configureLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureItems() {
        self.addSubview(contentView)
        RMShadowView.addShadow(toView: self, radius: radius, color: shadowColor, offset: offset, opacity: opacity)
        contentView.addSubview(imageView)
    }
    
    open func configureLayout() {
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(radius)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}
