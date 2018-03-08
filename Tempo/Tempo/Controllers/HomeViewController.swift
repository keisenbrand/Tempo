//
//  HomeViewController.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 1/30/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var menuView: MenuTableViewController!
    @IBOutlet weak var constraintMenuWidth: NSLayoutConstraint!
    @IBOutlet weak var constraintMenuLeft: NSLayoutConstraint!
    @IBOutlet var gestureScreenEdgePan: UIScreenEdgePanGestureRecognizer!
    
    let maxBlackViewAlpha:CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintMenuLeft.constant = -constraintMenuWidth.constant
        blackView.alpha = 0
        blackView.isHidden = true
        print("left: %d", constraintMenuLeft.constant)
        print("width: %d", constraintMenuWidth.constant)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let username = "keisenbrand";
        TempoAPIClient.shared.getCurrentUser(username: username) { user in
            if let user = user {
                self.configure(user)
            }
        }
    }
    
    func openMenu() {
        print("openMenu()")
        constraintMenuLeft.constant = 0
        blackView.isHidden = false
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            self.blackView.alpha = self.maxBlackViewAlpha
        }, completion: { (complete) in
            self.gestureScreenEdgePan.isEnabled = false
        })
    }
    
    func hideMenu() {
        print("hideMenu()")
        constraintMenuLeft.constant = -constraintMenuWidth.constant
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
            self.blackView.alpha = 0
        }, completion: { (complete) in
            self.gestureScreenEdgePan.isEnabled = true
            self.blackView.isHidden = true
        })
    }
    
    @IBAction func gestureScreenEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.began {
            blackView.isHidden = false
            blackView.alpha = 0
        } else if (sender.state == UIGestureRecognizerState.changed) {
            let translationX = sender.translation(in: sender.view).x
            if -constraintMenuWidth.constant + translationX > 0 {
                constraintMenuLeft.constant = 0
                blackView.alpha = maxBlackViewAlpha
            } else if translationX < 0 {
                constraintMenuLeft.constant = -constraintMenuWidth.constant
                blackView.alpha = 0
            } else {
                constraintMenuLeft.constant = -constraintMenuWidth.constant + translationX
                
                let ratio = translationX / constraintMenuWidth.constant
                let alphaValue = ratio * maxBlackViewAlpha
                blackView.alpha = alphaValue
            }
        } else {
            if constraintMenuLeft.constant < -constraintMenuWidth.constant / 2 {
                self.hideMenu()
            } else {
                self.openMenu()
            }
        }
    
    }
    
    @IBAction func gesturePan(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.began {
            // Do nothing
        } else if sender.state == UIGestureRecognizerState.changed {
            let translationX = sender.translation(in: sender.view).x
            if translationX > 0 {
                constraintMenuLeft.constant = 0
                blackView.alpha = maxBlackViewAlpha
            } else if translationX < -constraintMenuWidth.constant {
                constraintMenuLeft.constant = -constraintMenuWidth.constant
                blackView.alpha = 0
            } else {
                constraintMenuLeft.constant = translationX
                let ratio = (constraintMenuWidth.constant + translationX) / constraintMenuWidth.constant
                let alphaValue = ratio * maxBlackViewAlpha
                blackView.alpha = alphaValue
            }
        } else {
            if constraintMenuLeft.constant < -constraintMenuWidth.constant / 2 {
                self.hideMenu()
            } else {
                self.openMenu()
            }
        }
    }
    
    @IBAction func gestureTap(_ sender: UITapGestureRecognizer) {
        self.hideMenu()
    }
    
    @IBAction func tapMenu(_ sender: UIButton) {
        if constraintMenuLeft.constant < 0 {
            self.openMenu()
        } else {
            self.hideMenu()
        }
    }
    
    func configure(_ user: User) { // 2

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

