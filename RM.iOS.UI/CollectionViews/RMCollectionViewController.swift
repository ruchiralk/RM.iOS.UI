//
//  RMCollectionViewController.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/16/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class RMCollectionViewController: UIViewController, RMInitializeView {

    public var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero)
        return collectionView
    }()
    
    public var flowLayout: UICollectionViewLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        return flowLayout
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureViewHierarchy()
        configureLayout()
        collectionView.collectionViewLayout = flowLayout
    }
    
    open func configureViewHierarchy() {
        self.view.addSubview(collectionView)
    }
    
    open func configureLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
}

extension  RMCollectionViewController : UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
