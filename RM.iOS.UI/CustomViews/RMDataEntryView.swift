//
//  DataEntryView.swift
//  ShoppingRewards
//
//  Created by Ruchira Munidasa on 6/19/19.
//  Copyright © 2019 StoneAppy. All rights reserved.
//

import UIKit

public class RMDataEntryView: UIView {

    private var bottomConstraintConstant: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeKeyboardNotifications()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeKeyboardNotifications()
    }
    
    private func initializeKeyboardNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
             NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification){
        let firstResponder = findFirstResponder(inView: self)
        let firstResponderInsuperView = (firstResponder?.convert(firstResponder!.bounds, to: self.superview))!
        let bottomConstaint = bottomConstraint()
        
        let keyboardInfo = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        if (keyboardInfo?.cgRectValue.intersects(firstResponderInsuperView))! {
            bottomConstraintConstant = bottomConstaint?.constant // keep track of original value to reset when keyboard get dismiss
            let offset =  firstResponderInsuperView.maxY - keyboardInfo!.cgRectValue.height
            bottomConstaint?.constant = bottomConstaint!.constant - offset
            //move up
        }
    }
    
    @objc func keyboardWillHideNotification(notification: Notification){
        if let bottomConstant = bottomConstraintConstant {
            bottomConstraint()?.constant = bottomConstant
            bottomConstraintConstant = nil // clear stored value
        }
    }
    
    
    func findFirstResponder(inView view: UIView) -> UIView? {
        for subView in view.subviews {
            if subView.isFirstResponder {
                return subView
            }
            
            if let recursiveSubView = self.findFirstResponder(inView: subView) {
                return recursiveSubView
            }
        }
        return nil
    }
    
    func bottomConstraint() -> NSLayoutConstraint? {
        return self.superview?.constraints.filter({ $0.firstAttribute == .bottom && ($0.firstItem as? UIView)  == self  }).first
    }

}
