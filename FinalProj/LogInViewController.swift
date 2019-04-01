//
//  LogInViewController.swift
//  FinalProj
//
//  Created by Allen Zhai on 11/30/17.
//  Copyright © 2017 Maggie Chang. All rights reserved.
//

import UIKit
import FirebaseAuthUI
import FirebaseAuth

class LogInViewController: UIViewController,FUIAuthDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
            if let uid = user?.uid {
            print("Signed in UID \(uid)")
            }
    }

    override func viewDidAppear(_ animated: Bool) {
        if let uid = Auth.auth().currentUser?.uid {
            print("UID is \(uid)")
            performSegue(withIdentifier: "Main", sender: nil)
        }
        else {
            if let authUI = FUIAuth.defaultAuthUI() {
                authUI.providers = []
                authUI.isSignInWithEmailHidden = false
                authUI.delegate = self
                let vc = authUI.authViewController()
                present(vc, animated: true, completion: nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


