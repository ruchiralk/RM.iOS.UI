//
//  CardTableViewCell.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 28/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit

class RMCardTableViewCell : UITableViewCell {
    
    lazy var cardView: CardView = {
        let cardView = CardView(frame: .zero)
        return cardView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        configureLayout()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initialize(){
        self.contentView.addSubview(cardView)
    }
    
    func configureLayout(){
        cardView.updateLayout() // update the header footer heights
        cardView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(14.0)
        }
    }
}

class CardView : UIView {
    
    lazy var headerView: CardContainer = {
        let container = CardContainer()
        container.backgroundColor = UIColor.white
        container.height = 200
        return container
    }()
    
    lazy var footerView: CardContainer = {
        let container = CardContainer()
        container.backgroundColor = UIColor.white
        container.height = 100
        return container
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
        self.addSubview(headerView)
        self.addSubview(footerView)
    }
    
    func configureLayout(){
        headerView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(headerView.height)
        }
        
        footerView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func updateLayout(){
        headerView.snp.updateConstraints { (make) in
            make.height.equalTo(headerView.height)
        }
    }
    
    
}

class CardContainer : UIView {
    var height: CGFloat = 0
}
