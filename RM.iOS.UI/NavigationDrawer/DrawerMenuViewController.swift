//
//  DrawerMenuViewController.swift
//  RM.Mobile.Core
//
//  Created by Ruchira Munidasa on 29/04/2019.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class DrawerMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    public let headerView: UIView
    public let footerView: UIView
    public let tableView: UITableView
    public var headerViewHeight: CGFloat = 100.0
    public var footerviewHeight: CGFloat = 52.0
    
    public init(){
        headerView = UIView(frame: CGRect.zero)
        footerView = UIView(frame: CGRect.zero)
        tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        super.init(nibName: nil, bundle: nil)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle? not supported")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    // configure common autolayout constraints in viewdidload
    private func configureLayout(){
        self.view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: headerViewHeight).isActive = true
        
        footerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        footerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        footerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: footerviewHeight).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("Please override in sub class")
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Please override in sub class")
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
