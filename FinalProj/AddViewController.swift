//
//  AddViewController.swift
//  FinalProj
//
//  Created by Maggie Chang on 11/13/17.
//  Copyright © 2017 Maggie Chang. All rights reserved.
//

import UIKit
import FirebaseDatabaseUI
import FirebaseDatabase
import FirebaseAuth

class AddViewController: UIViewController {
    

    
    @IBOutlet weak var reminderInput: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteInput: UITextField!
    
    var priLevelNum = 0
    var priLevel = ""
    
    @IBAction func priority(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            priLevelNum = 3
            priLevel = "Low"
        }
        else if sender.selectedSegmentIndex == 1 {
            priLevelNum = 2
            priLevel = "Medium"
        }
        else {
            priLevelNum = 1
            priLevel = "High"
        }
    }
    
    
    @IBAction func AddButton(_ sender: Any) {
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child(userID!)
        let uid = ref.childByAutoId()
        let reminderRef = uid.child("Reminder")
        reminderRef.setValue(reminderInput.text)
        let noteRef = uid.child("Notes")
        noteRef.setValue(noteInput.text)
        let priRefNum = uid.child("Priority Number")
        priRefNum.setValue(priLevelNum)
        let priRef = uid.child("Priority")
        priRef.setValue(priLevel)
        let date = uid.child("Finish By")
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY, hh:mm a"
        date.setValue(formatter.string(from: datePicker.date))
        
        performSegue(withIdentifier: "unwindToTableView", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ xText: UITextField) -> Bool {
        xText.resignFirstResponder()
        return(true)
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
