//
//  RMFormTextView.swift
//  PawnShopApp
//
//  Created by Ruchira Munidasa on 04/09/2019.
//  Copyright © 2019 StoneAppy. All rights reserved.
//

import UIKit

open class RMFormTextView: UITextView {

    var placeholder: String? {
        didSet {
            self.defaultTextColor = self.textColor
            self.text = placeholder
        }
    }
    
    override open var text: String! {
        didSet {
            if text != placeholder {
                self.textColor = defaultTextColor
            }else{
                self.textColor = placeholderTextColor
            }
        }
    }
    
    override open var textColor: UIColor? {
        didSet {
            self.defaultTextColor = textColor
        }
    }
    
    private var defaultTextColor: UIColor? = UIColor.black
    var placeholderTextColor = UIColor.lightGray
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textViewDidBeginEditing(){
        if self.text == placeholder {
            self.text = ""
            self.textColor = defaultTextColor
        }
    }
    
    func textViewDidEndEditing(){
        if self.text.isEmpty {
            self.text = placeholder
            self.textColor = placeholderTextColor
        }
    }
    
}


