//
//  DatePickerCollectionViewCell.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 27/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit

protocol RMDatePickerCellStyle : UICollectionViewCell  {
    
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var borderColor: UIColor { get }
    var font: UIFont { get }
    var normalBackgroundColor: UIColor { get }
    var selectedBackgroundColor: UIColor { get }
    var normalTextColor: UIColor { get }
    var selectedTextColor: UIColor { get }
}

class RMDatePickerCollectionViewCell : RMTextLabelCollectionViewCell, RMDatePickerCellStyle {
    
    override var isSelected: Bool {
        didSet{
            if !isSelected {
                applyNormalCellStyles()
            }else{
                applySelectedCellStyles()
            }
        }
    }
    
   override func initialize(){
        super.initialize()
        applyNormalCellStyles()
        if cornerRadius > 0 { // enable maskToBound only if cornerRadius is given
            self.contentView.layer.masksToBounds = true
            self.contentView.layer.cornerRadius = cornerRadius
        }
        textLabel?.font = font
    }
    
    private func applyNormalCellStyles(){
        self.contentView.backgroundColor = normalBackgroundColor
        if borderWidth > 0 {
            self.contentView.layer.borderWidth = borderWidth
            self.contentView.layer.borderColor = borderColor.cgColor
        }
        textLabel?.textColor = normalTextColor
    }
    
    private func applySelectedCellStyles(){
        self.contentView.backgroundColor = selectedBackgroundColor
        if borderWidth > 0 {
            self.contentView.layer.borderWidth = 0
            self.contentView.layer.borderColor = UIColor.clear.cgColor
        }
        textLabel?.textColor = selectedTextColor
    }
}

// define default date picker styles
// you can always customize by subclassing
extension RMDatePickerCellStyle {
    
    var cornerRadius: CGFloat {
        return self.bounds.height/2
    }
    
    var borderWidth: CGFloat {
        return 2
    }
    
    var borderColor: UIColor {
        return UIColor(red: 228.0/255, green: 228.0/255, blue: 228.0/255, alpha: 1.0)
    }
    
    var font: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    
    var normalBackgroundColor: UIColor {
        return UIColor(red: 249.0/255, green: 250.0/255, blue: 249.0/255, alpha: 1.0)
    }
    
    var selectedBackgroundColor: UIColor {
        return UIColor(red: 99.0/255, green: 81.0/255, blue: 178.0/255, alpha: 1.0)
    }
    
    var normalTextColor: UIColor {
        return UIColor(red: 58.0/255, green: 58.0/255, blue: 58.0/255, alpha: 1.0)
    }
    
    var selectedTextColor: UIColor {
        return UIColor.white
    }
}

