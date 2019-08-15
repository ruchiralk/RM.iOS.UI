//
//  KeyboardObservable.swift
//  ShoppingRewards
//
//  Created by Ruchira Munidasa on 12/08/2019.
//  Copyright © 2019 StoneAppy. All rights reserved.
//

import RxSwift
import RxCocoa
import UIKit

class KeyboardObservable {
    static func keyboardHeightChangeObservable() -> Observable<CGFloat> {
        return Observable
            .from([
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
                    .map { notification -> CGFloat in
                        (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
                },
                NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
                    .map { _ -> CGFloat in
                        0
                }
                ])
            .merge()
    }
}
