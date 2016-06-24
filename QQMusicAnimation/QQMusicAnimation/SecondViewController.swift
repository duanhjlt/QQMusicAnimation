//
//  SecondViewController.swift
//  QQMusicAnimation
//
//  Created by duanhongjin on 6/24/16.
//  Copyright © 2016 duanhongjin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var imageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "superBoy.jpg")
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = view.center
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 100
        imageView.contentMode = .ScaleAspectFill
        
        view.addSubview(imageView)
    }

    @IBAction func onBackClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
