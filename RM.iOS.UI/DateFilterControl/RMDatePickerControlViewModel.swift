//
//  DateSelectorViewModel.swift
//  TemperJSearch
//
//  Created by Ruchira Munidasa on 27/07/2019.
//  Copyright © 2019 RuchiraM. All rights reserved.
//

import Foundation
import RxRelay

class RMDatePickerControlViewModel {
    
    // initializing date formatter can be a processer intensive operation
    // keep a single instance
    private lazy var dateFormatter = {
       return DateFormatter()
    }()
    
    var selectedDate = BehaviorRelay<Date>(value: Date()) // set default date to today
    
    // ahead: number of days to advance from current date
    func dateFromCurrentDate(ahead: Int) -> Date? {
        return Calendar.current.date(byAdding: .day, value: ahead, to: Date())
    }
    
    func dateStringInMMMDFormat(date: Date) ->  String {
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: date)
    }
}
