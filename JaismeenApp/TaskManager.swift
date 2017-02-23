//
//  TaskManager.swift
//  JaismeenApp
//
//  Created by Student on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
//

import UIKit
import Firebase
struct keyvar {
    static var key = ""
}

class TaskManager: UITableViewCell {
    
    var ref: FIRDatabaseReference!
    var itemList = [ToDoItem]()
    @IBOutlet weak var editbtn: UIButton!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Item: UILabel!
    @IBOutlet weak var statusBtn: UISwitch!
    @IBOutlet weak var myTable: UITableView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var indexPath: NSIndexPath!
 
    
  
   @IBAction func changeStatus(_ sender: UISwitch)
   {
    if let superview = statusBtn.superview // To fetch the Index of Cell
    {
        if let cell = superview.superview as? TaskManager
        {
            indexPath = myTable.indexPath(for: cell) as NSIndexPath!
            
            let count: Int = indexPath.row
            var itemkey: String!
            
            ref = FIRDatabase.database().reference()
            ref.child("My To Do Items").observe(.value, with: { // To get the key
                snapshot in
                
                let childSnap:NSObject = snapshot.children.allObjects[count] as! NSObject
                let snap = childSnap as! FIRDataSnapshot
                keyvar.key = snap.key
                itemkey = keyvar.key
                
                var saveItem = ToDoItem()
                saveItem.name = self.Item.text!
                saveItem.description = self.Desc.text!
                
                if sender.isOn==true
                {
                    saveItem.completed = "true"
                    self.Item.textColor = UIColor.black
                    self.Desc.textColor = UIColor.black
                    self.editbtn.isEnabled=true
                    self.ref.child("My To Do Items").child(itemkey).updateChildValues(saveItem.getDict())
                }
                else
                {
                    saveItem.completed = "false"
                    self.Item.textColor = UIColor.lightGray
                    self.Desc.textColor = UIColor.lightGray
                    self.editbtn.isEnabled=false
                    self.ref.child("My To Do Items").child(itemkey).updateChildValues(saveItem.getDict())
                }
                
            })
           
        }
    }}
    
    
    @IBAction func editItem(_ sender: UIButton) {
        
        if let superview = editbtn.superview // To fetch the Index of Cell edit button
        {
            if let cell = superview.superview as? TaskManager
            {
                indexPath = myTable.indexPath(for: cell) as NSIndexPath!
                
                let count: Int = indexPath.row
                var itemkey: String!
                
                ref = FIRDatabase.database().reference()
                ref.child("My To Do Items").observe(.value, with: { // To get the key for the row from database
                    snapshot in
                    
                    let childSnap:NSObject = snapshot.children.allObjects[count] as! NSObject
                    let snap = childSnap as! FIRDataSnapshot
                    keyvar.key = snap.key
                    itemkey = keyvar.key
                    
                    var saveItem = ToDoItem()
                    saveItem.name = self.Item.text!
                    saveItem.description = self.Desc.text!
                    self.ref.child("My To Do Items").child(itemkey).updateChildValues(saveItem.getDict())
                    
                })
                
            }}}

  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
