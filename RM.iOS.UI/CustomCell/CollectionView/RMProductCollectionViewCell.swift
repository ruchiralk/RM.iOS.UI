//
//  RMProductCollectionViewCell.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import SnapKit

open class RMProductCollectionViewCell: UICollectionViewCell, RMInitializeView {
    
    open var viewPadding: CGFloat {
        return 20
    }
    
    open var productImageViewHeight: CGFloat {
        return 240
    }
    
    public let productImageView: RMShadowImageView = {
       let imageView = RMShadowImageView(frame: .zero)
        imageView.contentMode = ContentMode.scaleAspectFill
        imageView.image = UIImage(named: "TestImage")
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    public let descriptionTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return textView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureItems()
        configureLayout()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureItems() {
        self.contentView.addSubview(productImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionTextView)
    }
    
    open func configureLayout() {
        productImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(viewPadding)
            make.top.equalToSuperview().inset(viewPadding)
            make.trailing.equalToSuperview().inset(viewPadding)
            make.height.equalTo(productImageViewHeight)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView.snp.bottom).offset(viewPadding)
            make.leading.equalToSuperview().inset(viewPadding)
            make.trailing.equalToSuperview().inset(viewPadding)
        }
        
        descriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalToSuperview().inset(viewPadding)
            make.trailing.equalToSuperview().inset(viewPadding)
            make.bottom.lessThanOrEqualToSuperview().inset(viewPadding)
        }
    }
    
    
}
