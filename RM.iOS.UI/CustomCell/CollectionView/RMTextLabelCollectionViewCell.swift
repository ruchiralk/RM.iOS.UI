//
//  TextLabelCollectionViewCell.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import SnapKit

class RMTextLabelCollectionViewCell: UICollectionViewCell {
    
    var textLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        configureLayout()
    }
    
    func initialize(){
        textLabel = UILabel()
        textLabel?.textAlignment = .center
        contentView.addSubview(textLabel!)
    }
    
    func configureLayout(){
        textLabel?.snp.makeConstraints({ (make) in
            make.leading.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(5)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        })
    }
}
