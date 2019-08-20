//
//  RMPlaceBidCardViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/18/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import RM_iOS_UI
import SnapKit

class RMPlaceBidCardViewController: RMCardViewController {
    
    var enterBidLabel: UILabel = {
       let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = NSLocalizedString("Enter Bid", comment: "")
        label.textColor = UIColor.white
        return label
    }()
    
    var enterBidTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        textField.textColor  = UIColor.white
        textField.textAlignment = .center
        textField.keyboardType = UIKeyboardType.decimalPad
        return textField
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureItems() {
        super.configureItems()
        self.view.addSubview(enterBidLabel)
         self.view.addSubview(enterBidTextField)
    }
    
    override func configureLayout() {
        super.configureLayout()
        enterBidLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }
        
        enterBidTextField.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(enterBidLabel.snp.bottom).offset(20)
            make.height.equalTo(60)
        }
    }
    
    override func cardViewWillChangeState(cardState: RMCardViewController.CardState) {
        super.cardViewWillChangeState(cardState: cardState)
        switch cardState {
        case .expanded:
            break
        case .collapsed:
            enterBidTextField.resignFirstResponder()
        }
    }
    
    override func cardViewDidChangedState(cardState: RMCardViewController.CardState) {
        super.cardViewDidChangedState(cardState: cardState)
        switch cardState {
        case .expanded:
            enterBidTextField.becomeFirstResponder()
        case .collapsed:
            break
        }
    }
}
