//
//  TaskManager.swift
//  JaismeenApp
//
//  Created by Student on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
//

import UIKit
import Firebase
class TaskManager: UITableViewCell {
   
   
    @IBOutlet weak var editbtn: UIButton!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Item: UILabel!
    @IBOutlet weak var statusBtn: UISwitch!
    var ref: FIRDatabaseReference!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
   @IBAction func changeStatus(_ sender: UISwitch) {
    
    ref = FIRDatabase.database().reference()
    var saveItem = ToDoItem()
    saveItem.name = Item.text!
    saveItem.description = Desc.text!
    
        if sender.isOn==true
        {
            
            saveItem.completed = "true"
            Item.textColor = UIColor.black
            Desc.textColor = UIColor.black
            editbtn.isEnabled=true
            ref.child("My To Do Items").child(Item.text!).updateChildValues(saveItem.getDict())

           
        }
        else
        {
            saveItem.completed = "false"
            Item.textColor = UIColor.lightGray
            Desc.textColor = UIColor.lightGray
            editbtn.isEnabled=false
            ref.child("My To Do Items").child(Item.text!).updateChildValues(saveItem.getDict())
        }
    }
    
    
    @IBAction func editItem(_ sender: UIButton) {
        
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
