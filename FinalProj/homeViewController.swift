//
//  homeViewController.swift
//  FinalProj
//
//  Created by Hannah Allen on 12/1/17.
//  Copyright © 2017 Maggie Chang. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuthUI
import FirebaseAuth

class homeViewController: UIViewController {
    
    @IBAction func homeButton(_ sender: Any) {
    }
    
    @IBAction func workButton(_ sender: Any) {
    }
    
    @IBAction func healthButton(_ sender: Any) {
    }
    
    @IBAction func otherButton(_ sender: Any) {
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //        let ref = Database.database().reference()
        //        let itemRef = ref.child("ellie")
        //        itemRef.setValue("alana")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homePlease" {
            let name = segue.destination as? personalViewController
            name?.inputData = "Home"
        }
            else if segue.identifier == "workPlease"{
                let name = segue.destination as? personalViewController
                name?.inputData = "Work"
        }
        else if segue.identifier == "healthPlease"{
            let name = segue.destination as? personalViewController
            name?.inputData = "Health"
        }
        else if segue.identifier == "otherPlease"{
            let name = segue.destination as? personalViewController
            name?.inputData = "Other"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
