//
//  TableViewController.swift
//  FinalProj
//
//  Created by Maggie Chang on 11/9/17.
//  Copyright © 2017 Maggie Chang. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseDatabaseUI
import FirebaseAuth

    class DeletableTableDataSource: FUITableViewDataSource {
        typealias PopulateCellBlock = (UITableView, IndexPath, DataSnapshot) -> UITableViewCell
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
            if (editingStyle != .delete) {
                return
            }
            // Delete the data from Firebase.
            snapshot(at: indexPath.row).ref.removeValue()
        }
    }
    // create a . bindDeletable function to supplement the normal .bind function
    extension UITableView  {
        func bindnDeletable(to query: DatabaseQuery, populateCell: @escaping DeletableTableDataSource.PopulateCellBlock) -> DeletableTableDataSource
        {
            let dataSource = DeletableTableDataSource(query: query,populateCell: populateCell)
            dataSource.bind(to: self)
            return dataSource
        }
    }

class RemindTableViewCell: UITableViewCell{
    var snapshot: DataSnapshot?
    
    
    @IBOutlet weak var remindCell: UILabel!
    @IBOutlet weak var noteCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}

class TableViewController: UITableViewController {
    
    @IBAction func unwindToTableView(segue:UIStoryboardSegue) { }
    
    var dataSource: FUITableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child(userID!)
        dataSource = tableView.bindnDeletable(to: ref.queryOrdered(byChild: "Priority Number")) {
            (tableView: UITableView, indexPath: IndexPath, data: DataSnapshot) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableIdentifier") as! RemindTableViewCell
            let reminderSnap = data.childSnapshot(forPath: "Reminder")
            cell.remindCell.text = reminderSnap.value as? String
//            let notesSnap = data.childSnapshot(forPath: "Notes")
//            cell.noteCell.text = notesSnap.value as? String
            let finishBySnap = data.childSnapshot(forPath: "Finish By")
            cell.noteCell.text = finishBySnap.value as? String
            cell.snapshot = data
            self.navigationItem.leftBarButtonItem = self.editButtonItem
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "cellPressed" {
            let dest = segue.destination as! moreInfoViewController
            let cell = sender as! RemindTableViewCell
            let remindText = cell.snapshot?.childSnapshot(forPath: "Reminder")
            dest.remindValue = (remindText?.value as? String)!
        
            let priorityVal = cell.snapshot?.childSnapshot(forPath: "Priority")
            dest.priorityValue = (priorityVal?.value as? String)!
        
            let noteText = cell.snapshot?.childSnapshot(forPath: "Notes")
            dest.notesValue = (noteText?.value as? String)!
        
            let finishByLabel = cell.snapshot?.childSnapshot(forPath: "Finish By")
            dest.finishByValue = (finishByLabel?.value as? String)!
     }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Subclass FUITableViewDataSource to received the tableView:commit:forRowAt: callback and delete a row from Firebase
    
   
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "cellPressed" {
//            let dest = segue.destination as! moreInfoViewController
//            let cell = sender as! moreInfo
//            let reminderL = cell.snapshot?.childSnapshot(forPath: "Reminder")
//            dest.inputData = (reminderL?.value as? String)!
//
//        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    //}
 

}
