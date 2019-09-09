//
//  DrawerViewController.swift
//  RM.Mobile.Core
//
//  Created by Ruchira Munidasa on 29/04/2019.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class DrawerViewController : UIViewController {
    
    public var drawerMenuMaxWidth = 320.0 // Maximum width used for Drawer Menu
    private let menuViewController: DrawerMenuViewController // side menu
    private let contentViewController: DrawerContent // main content
    private var isMenuExpaned: Bool // track menu expaned or not
    private var overlayView: UIView // when menu expaned show overlay over main content
    open override var prefersStatusBarHidden: Bool {
        return isMenuExpaned // hide status bar when menu is showing
    }
    private var menuBarButtonItem: UIBarButtonItem?
    
    public init(menuViewController: DrawerMenuViewController, contentViewController: DrawerContent) {
        self.menuViewController = menuViewController
        self.contentViewController = contentViewController
        self.isMenuExpaned = false
        self.overlayView = UIView()
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureContentView()
        configureOverlayView()
        configureNavigationMenu()
        configureGestures()
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutOverlayView()
        layoutNavigationMenu()
    }
    
    private func configureNavigationBar(){
        menuBarButtonItem = UIBarButtonItem(image: UIImage(named: "HamburgerIcon"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(onHamburgerIconTap(barButton:)))
        self.navigationItem.leftBarButtonItem = menuBarButtonItem
    }
    
    // set properties on viewDidLoad
    private func configureContentView()
    {
        self.addChild(contentViewController)
        self.view.addSubview(contentViewController.view)
        self.didMove(toParent: contentViewController)
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentViewController.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentViewController.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentViewController.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contentViewController.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // set basic properties on viewDidLoad
    private func configureOverlayView(){
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0
        self.view.addSubview(overlayView)
    }
    
    // set basic properties on viewDidLoad
    private func configureNavigationMenu(){
        self.menuViewController.view.frame = CGRect(x: 0, y: 0, width: calculateNMenuWdith(), height: Double(self.view.bounds.height))
        self.menuViewController.view.clipsToBounds = true
        self.addChild(menuViewController)
        self.view.addSubview(self.menuViewController.view)
        self.menuViewController.didMove(toParent: self)
    }
    
    private func configureGestures(){
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(toggleMenu))
        swipeRightGesture.direction = .right
        self.view.addGestureRecognizer(swipeRightGesture)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(toggleMenu))
        swipeLeftGesture.direction = .left
        self.view.addGestureRecognizer(swipeLeftGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleMenu))
        overlayView.addGestureRecognizer(tapGesture)
    }
    
    // called on viewDidLayoutSubviews
    private func layoutOverlayView(){
        self.overlayView.frame = self.view.bounds
    }

    // called on viewDidLayoutSubviews
    private func layoutNavigationMenu(){
        menuViewController.view.frame = CGRect(x: 0, y: 0, width: calculateNMenuWdith(), height: Double(self.view.bounds.height))
    }
    
    private func calculateNMenuWdith() -> Double {
//        var menuWidth = Double(view.bounds.width) * 2/3
//        if menuWidth > drawerMenuMaxWidth {
//            menuWidth = drawerMenuMaxWidth
//        }
       return isMenuExpaned ? drawerMenuMaxWidth : 0.0
    }
    
    @objc private func onHamburgerIconTap(barButton: UIBarButtonItem){
        toggleMenu()
    }
    
    @objc public func toggleMenu(){
        self.isMenuExpaned = !isMenuExpaned
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.setNavigationBarHidden(isMenuExpaned, animated: true)
        
        weak var weakself = self
        UIView.animate(withDuration: 0.08, animations: {
            if let weakself = weakself {
                self.menuViewController.view.frame = CGRect(x: 0, y: 0, width: weakself.calculateNMenuWdith(), height: Double(self.view.bounds.height))
                self.menuViewController.view.setNeedsLayout()
                self.overlayView.alpha = weakself.isMenuExpaned ? 0.5 : 0.0
            }
        }) { (flag) in
        
        }
        
    }
    
    // MARK: - Detect Orientation Changes
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if isMenuExpaned {
            toggleMenu()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
