//
//  SecondViewController.swift
//  JaismeenApp
//
//  Created by Apple on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
//

import UIKit
import Firebase
struct ToDoItem {
    
    var description: String = ""
    var name: String = ""
    var completed: String = ""
    func getDict() -> [String:String] {
        let dict = ["Name": self.name,
        "Description": self.description,
        "Completed":self.completed
        ]
        return dict
    }
}
class MyToDoItem: NSObject{
    
    var itemName: String?
    var itemDescription: String?
}

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var Desc: UITextField!
    @IBOutlet weak var Item: UITextField!
    
    var ref: FIRDatabaseReference!
    
 
    
    @IBAction func submit(_ sender: UIButton) {
        
        
        var saveItem = ToDoItem()
        saveItem.name = Item.text!
        saveItem.completed = "true"
        saveItem.description = Desc.text!
        
        ref = FIRDatabase.database().reference()
        ref.child("My To Do Items").child(Item.text!).updateChildValues(saveItem.getDict())
        Item.text=""
        Desc.text=""
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

