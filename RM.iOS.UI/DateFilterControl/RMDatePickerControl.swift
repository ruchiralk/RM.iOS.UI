//
//  DayFilter.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 27/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import UIKit
import RxRelay

class RMDatePickerControl : NSObject {
    
    private let reuseIdentifier = "DatePickerCell"
    private let collectionView: UICollectionView
    private let flowLayout: UICollectionViewFlowLayout
    private let viewModel = RMDatePickerControlViewModel()
    var backgroundColor = UIColor.white {
        didSet{
            collectionView.backgroundColor = backgroundColor
        }
    }
    
    // expose selectedDate Observable
    var selectedDate: BehaviorRelay<Date> {
        return viewModel.selectedDate
    }
    
    override init() {
        flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = backgroundColor
        super.init()
    }
    
    func intialize(cellType: AnyClass, itemSize: CGSize) -> UIView? {
        flowLayout.itemSize = itemSize
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(cellType, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }
}

extension RMDatePickerControl : UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 365 // limit to one year
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? RMDatePickerCollectionViewCell
        if let date = viewModel.dateFromCurrentDate(ahead: indexPath.row) {
            cell?.textLabel?.text = viewModel.dateStringInMMMDFormat(date: date)
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let date = viewModel.dateFromCurrentDate(ahead: indexPath.row) {
            viewModel.selectedDate.accept(date)
        }
    }

}
