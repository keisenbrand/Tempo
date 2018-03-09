//
//  SignInViewController.swift
//  Tempo
//
//  Created by Katherine Rose Eisenbrand on 2/5/18.
//  Copyright © 2018 Katherine Rose Eisenbrand. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = "427934463979-ko17gaume90gc2geegli5rqtv06aitic.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //GID Sign-In Delegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let email = user.profile.email
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let brandsViewController = storyBoard.instantiateViewController(withIdentifier: "NUXViewController") as? NUXViewController
            brandsViewController?.username = email
            brandsViewController?.userID = userId
            brandsViewController?.idToken = idToken
            brandsViewController?.fullName = fullName
            self.navigationController?.pushViewController(brandsViewController!, animated: true)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
