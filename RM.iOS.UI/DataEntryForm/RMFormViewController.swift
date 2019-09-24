//
//  RMFormViewController.swift
//  ShoppingRewards
//
//  Created by Ruchira Munidasa on 12/08/2019.
//  Copyright © 2019 StoneAppy. All rights reserved.
//  

import UIKit
import RxCocoa
import RxSwift

open class RMFormViewController: UIViewController {

    private var formScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    public var formContentView: UIStackView = {
        let formStackView = UIStackView()
        formStackView.axis = .vertical
        formStackView.alignment = .center
        formStackView.distribution = .fill
        formStackView.spacing = 20
        formStackView.translatesAutoresizingMaskIntoConstraints = false
        return formStackView
    }()
    
    private let disposeBag = DisposeBag()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        configureStackView()
        configureKeyboardNotifications()
    }
    
    private func configureScrollView(){
        self.view.addSubview(formScrollView)
        NSLayoutConstraint.activate([
            formScrollView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,  constant: 20),
            formScrollView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,  constant: -20),
            formScrollView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            formScrollView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    private func configureStackView(){
        self.formScrollView.addSubview(formContentView)
        NSLayoutConstraint.activate([
            formContentView.topAnchor.constraint(equalTo: formScrollView.topAnchor),
            formContentView.leadingAnchor.constraint(equalTo: formScrollView.leadingAnchor),
            formContentView.trailingAnchor.constraint(equalTo:formScrollView.trailingAnchor),
            formContentView.bottomAnchor.constraint(equalTo: formScrollView.bottomAnchor),
            formContentView.widthAnchor.constraint(equalTo: formScrollView.widthAnchor)
            ])
    }
    
    private func configureKeyboardNotifications(){
        KeyboardObservable.keyboardHeightChangeObservable()
            .subscribe { [unowned self](event) in
                let insets =  UIEdgeInsets(top: 0, left: 0, bottom: event.element!, right: 0)
                self.formScrollView.contentInset = insets
                self.formScrollView.scrollIndicatorInsets = insets
            }.disposed(by: disposeBag)
    }
}

extension RMFormViewController : UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RMFormViewController : UITextViewDelegate {
    public func textViewDidBeginEditing(_ textView: UITextView) {
        formScrollView.scrollRectToVisible(textView.frame, animated: true)
        if textView is RMFormTextView {
            (textView as? RMFormTextView)?.textViewDidBeginEditing()
        }
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView is RMFormTextView {
            (textView as? RMFormTextView)?.textViewDidEndEditing()
        }
    }
}

