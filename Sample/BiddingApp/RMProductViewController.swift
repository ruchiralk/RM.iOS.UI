//
//  RMProductViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI
import SnapKit

class RMProductViewController: RMFormViewController, RMInitializeView{

    public let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 26.0, weight: .medium)
        label.textColor = UIColor.black
        label.text = "Product Title"
        return label
    }()
    
    public let productImageView: RMShadowImageView = {
        let imageView = RMShadowImageView(frame: .zero)
        imageView.image = UIImage(named: "TestImage")
        return imageView
    }()
    
    public let productDescriptionView: RMProductDescriptionView = {
       let productDescriptionView = RMProductDescriptionView()
        return productDescriptionView
    }()
    
    public var imageHeight: CGFloat {
        return 260.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        configureLayout()
        self.view.backgroundColor = UIColor.white
    }
    
    func configureItems() {
        self.formContentView.addArrangedSubview(titleLabel)
        self.formContentView.addArrangedSubview(productImageView)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalTo(60.0)
        }
        productImageView.snp.makeConstraints { (make) in
            make.height.equalTo(imageHeight)
        }
    }

}
