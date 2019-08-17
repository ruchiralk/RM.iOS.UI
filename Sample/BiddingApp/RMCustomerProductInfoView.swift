//
//  RMCustomerProductInfo.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI
import SnapKit

class RMCustomerProductInfoView : UIStackView, RMInitializeView {
    
    var remainningTimeLabel: RMSubtitleLabel = {
        let label = RMSubtitleLabel()
        label.title.text = "Bid closes in"
        label.title.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.title.textColor = UIColor.lightGray
        label.subtitle.text = "5h 05m 40s"
        label.subtitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.subtitle.textColor = .black
        label.backgroundColor = .yellow
        return label
    }()
    
    var currentBidLabel: RMSubtitleLabel = {
        let label = RMSubtitleLabel()
        label.title.text = "Current bid"
        label.title.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.title.textColor = UIColor.lightGray
        label.subtitle.text = "$12,475"
        label.subtitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.subtitle.textColor = .black
         label.backgroundColor = .orange
        return label
    }()
    
    var totalBidsLabel: RMSubtitleLabel = {
        let label = RMSubtitleLabel()
        label.title.text = "Total Bids"
        label.title.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.title.textColor = UIColor.lightGray
        label.subtitle.text = "30"
        label.subtitle.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.subtitle.textColor = .black
        label.backgroundColor = .brown
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureItems()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureItems() {
        self.axis = .horizontal
        self.distribution = UIStackView.Distribution.equalCentering
        self.spacing = 80
        self.addArrangedSubview(remainningTimeLabel)
        self.addArrangedSubview(currentBidLabel)
        self.addArrangedSubview(totalBidsLabel)
    }
    
    func configureLayout() {
    }

}
