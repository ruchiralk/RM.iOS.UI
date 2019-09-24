//
//  RMProductDescriptionView.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI

class RMProductDescriptionView: UIStackView, RMInitializeView {

    let descriptionTextView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isScrollEnabled = false
        textView.isUserInteractionEnabled = false
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 14.0)
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return textView
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
        self.axis = .vertical
        self.distribution = .fillEqually
        self.addArrangedSubview(descriptionTextView)
    }
    
    func configureLayout() {
        
    }
    
}
