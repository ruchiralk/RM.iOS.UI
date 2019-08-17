//
//  RMCustomerProductViewController.swift
//  Sample
//
//  Created by Ruchira Munidasa on 8/17/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit
import SnapKit

class RMCustomerProductViewController: RMProductViewController {

    var productInfoView: RMCustomerProductInfoView = {
        let productInfoview = RMCustomerProductInfoView()
        return productInfoview
    }()
    
    var segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: [NSLocalizedString("Description", comment: ""), NSLocalizedString("Bids", comment: ""), NSLocalizedString("Comments", comment: "")])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentSelected(control:)), for: .valueChanged)
        return segmentedControl
    }()
    
    var availableBidsCollectionViewController: RMAvailableBidsCollectionViewController = {
        let controller = RMAvailableBidsCollectionViewController()
        controller.displayMode = .compact
        return controller
    }()
    
    private var bidsCollectionCompactHeightConstraitnt: Constraint?
    private var bidsCollectionExpandedHeightConstraint: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureItems() {
        super.configureItems()
        self.formContentView.addArrangedSubview(productInfoView)
        self.formContentView.addArrangedSubview(segmentedControl)
        self.formContentView.addArrangedSubview(productDescriptionView)
        
        self.addChild(availableBidsCollectionViewController)
        self.formContentView.addArrangedSubview(availableBidsCollectionViewController.view)
        availableBidsCollectionViewController.didMove(toParent: self)
    }
    
    override func configureLayout() {
        super.configureLayout()
        segmentedControl.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
        
        availableBidsCollectionViewController.view.snp.makeConstraints { (make) in
            bidsCollectionCompactHeightConstraitnt = make.height.equalTo(availableBidsCollectionViewController.viewHeightInCompactMode).constraint
            bidsCollectionExpandedHeightConstraint = make.bottom.equalTo(self.view).constraint
            make.width.equalToSuperview()
        }
        bidsCollectionCompactHeightConstraitnt?.activate()
        bidsCollectionExpandedHeightConstraint?.deactivate()
    }
    
    @objc func segmentSelected(control: UISegmentedControl){
        switch control.selectedSegmentIndex {
        case 0:
            showDetails()
        case 1:
            hideDetails()
        case 2:
            break
        default:
            fatalError("Not Handled")
        }
    }
    
    private func showDetails(){
        availableBidsCollectionViewController.displayMode = .compact
        self.productImageView.alpha = 0
        self.productImageView.isHidden = false
        self.bidsCollectionExpandedHeightConstraint?.deactivate()
        UIViewPropertyAnimator(duration: 0.3, dampingRatio: 0.79) {
            self.productDescriptionView.isHidden = false
            self.productInfoView.isHidden = false
             self.productImageView.alpha = 1
            self.bidsCollectionCompactHeightConstraitnt?.activate()
        }.startAnimation()
    }
    
    private func hideDetails(){
        availableBidsCollectionViewController.displayMode = .expanded
        self.productImageView.isHidden = true
        self.bidsCollectionCompactHeightConstraitnt?.deactivate()
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.79) {
            self.productDescriptionView.isHidden = true
            self.productInfoView.isHidden = true
            self.bidsCollectionExpandedHeightConstraint?.activate()
        }.startAnimation()
    }
    
  
    
}
