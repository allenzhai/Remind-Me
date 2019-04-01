//
//  moreInfoViewController.swift
//  FinalProj
//
//  Created by Maggie Chang on 11/16/17.
//  Copyright © 2017 Maggie Chang. All rights reserved.
//

import UIKit

class moreInfoViewController: UIViewController {
    @IBOutlet weak var remind: UILabel!
    @IBOutlet weak var notes: UILabel!
    @IBOutlet weak var priorityNum: UILabel!
    @IBOutlet weak var finishByLabel: UILabel!
    var remindValue = "hello"
    var notesValue = "get ready"
    var priorityValue = ""
    var finishByValue = ""
    //@IBOutlet weak var reminderLabel: UILabel!
    
    //    @IBOutlet weak var RL: UILabel!
//    @IBOutlet weak var NL: UILabel!
//
//    var inputData: String = "abc"
    override func viewDidLoad() {
        super.viewDidLoad()
        remind.text = remindValue
        notes.text = notesValue
        priorityNum.text = "\(priorityValue)"
        finishByLabel.text = finishByValue
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //RL.text = inputData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
    //}
    

}
