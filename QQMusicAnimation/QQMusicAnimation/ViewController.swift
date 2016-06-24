//
//  ViewController.swift
//  QQMusicAnimation
//
//  Created by duanhongjin on 6/24/16.
//  Copyright © 2016 duanhongjin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let control: UIControl = UIControl(frame: avatar.bounds)
        control.backgroundColor = UIColor.clearColor()
        control.addTarget(self, action: #selector(ViewController.onAvatarClicked), forControlEvents: .TouchUpInside)
        avatar.addSubview(control)
    }
    
    func onAvatarClicked() {
        let story: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC: UIViewController = story.instantiateViewControllerWithIdentifier("secondStory")
        secondVC.transitioningDelegate = self
        self .presentViewController(secondVC, animated: true, completion: nil)
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionFromFirstToSecond()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionFromSecondToFirst()
    }
}
