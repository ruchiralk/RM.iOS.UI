//
//  DrawerMenuTableViewCell.swift
//  RM.iOS.Core
//
//  Created by Ruchira Munidasa on 07/05/2019.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class DrawerMenuItemCell: UITableViewCell {

    public let iconImageView: UIImageView
    public let titleLabel: UILabel
    public let  cellSeparator: UIView
    
    public static var cellHeight: CGFloat {
        return 48.0
    }
    
    public static let iconWidth: CGFloat = cellHeight
    public static let labelPadding: CGFloat = 16.0
    private static let cellSeperatorHeight: CGFloat = 2.0
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        iconImageView = UIImageView(frame: CGRect.zero)
        iconImageView.contentMode = .scaleAspectFit
        titleLabel = UILabel(frame: CGRect.zero)
        cellSeparator = UIView(frame: CGRect.zero)
        cellSeparator.backgroundColor = UIColor.gray
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        configureTheme()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init?(coder aDecoder: NSCoder) not supported")
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    open func configureTheme(){
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.white
    }

    open func configureLayout(){
        self.contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageLeading = iconImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 13)
        imageLeading.priority = UILayoutPriority(999) // drawer does collapse and expand
        imageLeading.isActive = true
        
        iconImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: CGFloat(DrawerMenuItemCell.iconWidth - 26)).isActive = true
        
        let imageWidth = iconImageView.widthAnchor.constraint(equalToConstant: CGFloat(DrawerMenuItemCell.iconWidth - 26))
        imageWidth.priority = UILayoutPriority(999) // eliminate auto layout warnings when collapsing
        imageWidth.isActive = true
        
        self.contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let labelLeading = titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: CGFloat(DrawerMenuItemCell.labelPadding))
        labelLeading.priority = UILayoutPriority(999)
        labelLeading.isActive = true
        
        let labelTrailing = titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -CGFloat(DrawerMenuItemCell.labelPadding))
        labelTrailing.priority = UILayoutPriority(999)
        labelTrailing.isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true

        self.contentView.addSubview(cellSeparator)
            cellSeparator.translatesAutoresizingMaskIntoConstraints = false
            cellSeparator.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: CGFloat(DrawerMenuItemCell.labelPadding)).isActive = true
            cellSeparator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -CGFloat(DrawerMenuItemCell.labelPadding)).isActive = true
            cellSeparator.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
            cellSeparator.heightAnchor.constraint(equalToConstant: CGFloat(DrawerMenuItemCell.cellSeperatorHeight)).isActive = true
        
    }
}
