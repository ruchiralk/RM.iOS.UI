//
//  ICNLabel.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import SnapKit

class RMICNLabel: UIView {
    
    lazy var startIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var endIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = UIStackView.Distribution.fillProportionally
        stackView.spacing = 3
        return stackView
    }()
    
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
        self.addSubview(stackView)
        stackView.addArrangedSubview(startIcon)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(endIcon)
    }
    
    func configureLayout(){
        stackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
