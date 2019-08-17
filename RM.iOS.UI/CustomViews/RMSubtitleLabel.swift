//
//  RMSubtitleLabel.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class RMSubtitleLabel: UIStackView, RMInitializeView {

    public var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.black
        return label
    }()
    
    public var subtitle: UILabel =  {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.black
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
       
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureItems()
        configureLayout()
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureItems() {
        self.axis = .vertical
        self.distribution = .fill
        self.addArrangedSubview(title)
        self.addArrangedSubview(subtitle)
    }
    
    public func configureLayout() {
        
    }
}
