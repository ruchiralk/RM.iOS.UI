//
//  RMCardViewController.swift
//  RM.iOS.UI
//
//  Created by Ruchira Munidasa on 8/18/19.
//  Copyright © 2019 Ruchira Munidasa. All rights reserved.
//

import UIKit

open class RMCardViewController: UIViewController, RMInitializeView {

    public enum CardState {
        case expanded
        case collapsed
    }
    
    public var visualEffectView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(frame: .zero)
        visualEffectView.isUserInteractionEnabled = false
        return visualEffectView
    }()
    
    public let cardHeight: CGFloat
    public var cardHandleAreaHeight: CGFloat = 40
    
    private var cardVisible = false
    private var nextState: CardState {
        return cardVisible ?.collapsed : .expanded
    }
    
    private var runningAnimations = [UIViewPropertyAnimator]()
    private var animationProgressWhenInterrupted: CGFloat = 0
    private var cardViewParent: UIViewController?
    
    public init(addToViewController viewController: UIViewController, cardHeight: CGFloat = 500) {
        self.cardHeight = cardHeight
        self.cardViewParent = viewController
        super.init(nibName: nil, bundle: nil)
        viewController.view.addSubview(visualEffectView)
        viewController.addChild(self)
        viewController.view.addSubview(self.view)
        self.didMove(toParent: viewController)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        configureLayout()
        initializeGestureRecognizers()
    }
    
    open override func updateViewConstraints() {
        super.updateViewConstraints()
        visualEffectView.frame =  cardViewParent!.view.frame
        setCardViewCollapsedFrame()
    }
    
    open func configureItems() {
        self.view.clipsToBounds = true
        self.view.backgroundColor = UIColor(red: 77.0/255, green: 175.0/255, blue: 89.0/255, alpha: 1.0)
    }
    
    open func configureLayout() {
    
    }
    
    private func setCardViewCollapsedFrame(){
         self.view.frame = CGRect(x: cardViewParent!.view.frame.origin.x, y: cardViewParent!.view.frame.size.height - cardHandleAreaHeight, width: cardViewParent!.view.frame.size.width, height: cardHeight)
    }
    
    private func setCardViewExpandedFrame(){
        self.view.frame = CGRect(x: cardViewParent!.view.frame.origin.x, y: cardViewParent!.view.frame.size.height - cardHeight, width: cardViewParent!.view.frame.size.width, height: cardHeight)
    }
    
    //MARK: - Gestures
    private func initializeGestureRecognizers(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCardTap(recognizer:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleCardPan(recognizer:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        self.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc
    func handleCardTap(recognizer: UITapGestureRecognizer){
        switch recognizer.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.6)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began:
            // start transition
            startInetractiveTransition(state: nextState, duration: 0.6)
        case .changed:
            // update transition
            let translation = recognizer.translation(in: self.view)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            // continue transition
            continueInteractiveTransition()
        default:
            break
        }
    }
    
    open func cardViewWillChangeState(cardState: CardState){}
    
    open func cardViewDidChangedState(cardState: CardState){}
    
    private func animateTransitionIfNeeded(state: CardState, duration: TimeInterval){
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                   self.setCardViewExpandedFrame()
                case .collapsed:
                   self.setCardViewCollapsedFrame()
                }
                self.cardViewWillChangeState(cardState: state)
            }
            frameAnimator.addCompletion { (_) in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll() // remove all animations after completion
                self.cardViewDidChangedState(cardState: state)
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let cornerRaidusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.view.layer.cornerRadius = 12
                case .collapsed:
                    self.view.layer.cornerRadius = 0
                }
            }
            cornerRaidusAnimator.startAnimation()
            runningAnimations.append(cornerRaidusAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .regular)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
        }
    }
    
    private func startInetractiveTransition(state: CardState, duration: TimeInterval){
        if runningAnimations.isEmpty  {
            // run animations
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            // make them interactive
            animator.pauseAnimation()
            animationProgressWhenInterrupted  = animator.fractionComplete
        }
    }
    
    private func updateInteractiveTransition(fractionCompleted: CGFloat){
        //only update fraction complete
        for animator in runningAnimations {
            //update animator
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    private func continueInteractiveTransition(){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0) // setting this to zero make property animator use remanning time
        }
    }
    
}
