//
//  TransitionFromSecondToFirst.swift
//  QQMusicAnimation
//
//  Created by duanhongjin on 6/24/16.
//  Copyright © 2016 duanhongjin. All rights reserved.
//

import UIKit

class TransitionFromSecondToFirst: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let nav: UINavigationController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! UINavigationController
        let toVC: ViewController = nav.topViewController as! ViewController
        let fromVC: SecondViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! SecondViewController
        
        let containerView: UIView = transitionContext.containerView()!
        let duration: NSTimeInterval = self.transitionDuration(transitionContext)
        
        let cellImageSnapshot: UIView = fromVC.imageView.snapshotViewAfterScreenUpdates(true)
        cellImageSnapshot.frame = containerView.convertRect(fromVC.imageView.frame, fromView: fromVC.view)
        fromVC.imageView.hidden = true
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.view.alpha = 0
        toVC.avatar.hidden = true
        
        containerView.addSubview(nav.view)
        containerView.addSubview(cellImageSnapshot)
        
        UIView.animateWithDuration(duration, animations: { 
            toVC.view.alpha = 1
            let frame: CGRect = containerView.convertRect(toVC.avatar.frame, fromView: toVC.containerView)
            cellImageSnapshot.frame = frame
        }) { (finished: Bool) in
            toVC.avatar.hidden = false
            fromVC.imageView.hidden = false
            cellImageSnapshot.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
    }
}
