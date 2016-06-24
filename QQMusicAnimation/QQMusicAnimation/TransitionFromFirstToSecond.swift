//
//  TransitionFromFirstToSecond.swift
//  QQMusicAnimation
//
//  Created by duanhongjin on 6/24/16.
//  Copyright © 2016 duanhongjin. All rights reserved.
//

import UIKit

class TransitionFromFirstToSecond: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.25
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let nav: UINavigationController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! UINavigationController
        let fromVC: ViewController = nav.topViewController as! ViewController
        let toVC: SecondViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SecondViewController
        
        let containerView: UIView? = transitionContext.containerView()
        let duration: NSTimeInterval = self.transitionDuration(transitionContext)
        
        let cellImageSnapshot: UIView = fromVC.avatar.snapshotViewAfterScreenUpdates(true)
        cellImageSnapshot.frame = (containerView?.convertRect(fromVC.avatar.frame, fromView: fromVC.containerView))!
        fromVC.avatar.hidden = true
        
        toVC.view.frame = transitionContext.finalFrameForViewController(toVC)
        toVC.view.alpha = 0
        toVC.imageView.hidden = true
        
        containerView?.addSubview(toVC.view)
        containerView?.addSubview(cellImageSnapshot)
        
        UIView.animateWithDuration(duration, animations: { 
            toVC.view.alpha = 1
            let frame: CGRect = (containerView?.convertRect(toVC.imageView.frame, fromView: toVC.view))!
            cellImageSnapshot.frame = frame
            
            print("frame is \(frame)")
        }) { (finished: Bool) in
            toVC.imageView.hidden = false
            fromVC.avatar.hidden = false
            cellImageSnapshot.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }

}
