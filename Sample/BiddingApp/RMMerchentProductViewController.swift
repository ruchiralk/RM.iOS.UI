//
//  RMMerchentProductViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI
import SnapKit

class RMMerchentProductViewController: RMProductViewController {

    var merchentProductInfo: RMMerchentProductInfoView = {
        let productInfo = RMMerchentProductInfoView()
        productInfo.backgroundColor = UIColor.lightGray
        return productInfo
    }()
    
    var placeBidBtn: UIButton = {
       let button = UIButton(type: .custom)
        button.setTitle(NSLocalizedString("Place Bid", comment: ""), for: .normal)
        button.backgroundColor = UIColor(red: 77.0/255, green: 175.0/255, blue: 89.0/255, alpha: 1.0)
        return button
    }()
    
    private var cardViewController: RMCardViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.cardViewController = RMPlaceBidCardViewController(addToViewController: self)
    }
    
    override func configureItems() {
        super.configureItems()
        self.formContentView.addArrangedSubview(merchentProductInfo)
        self.formContentView.addArrangedSubview(productDescriptionView)
        self.formContentView.addArrangedSubview(placeBidBtn)
    }
 
    override func configureLayout() {
        super.configureLayout()
        merchentProductInfo.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(merchentProductInfo.viewHeight)
        }
        
        placeBidBtn.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(42)
        }
    }

}
