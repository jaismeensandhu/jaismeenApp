//
//  FirstViewController.swift
//  JaismeenApp
//
//  Created by Jaismeen Sandhu(300877728) on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
// List Page

import UIKit
import Firebase

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myTable: UITableView!
    
    var itemList = [ToDoItem]()
    var toitem = ToDoItem()
    var refHandle: UInt!
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        fetchList()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //print( "count" ,itemList.count);
        return itemList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Row", for: indexPath) as! TaskManager
        toitem = itemList[indexPath.row]
        cell.Item.text = toitem.name
        cell.Desc.text = toitem.description
        cell.statusBtn.isOn = Bool(toitem.completed)!
        if cell.statusBtn.isOn==true
        {
            cell.Item.textColor = UIColor.black
            cell.Desc.textColor = UIColor.black
            cell.editbtn.isEnabled=true
            cell.statusBtn.isOn = true
        }
        else
        {
            cell.Item.textColor = UIColor.lightGray
            cell.Desc.textColor = UIColor.lightGray
            cell.editbtn.isEnabled=false
            cell.statusBtn.isOn = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let count: Int = indexPath.row
            let itemkey: String = itemList[count].key
            ref.child("My To Do Items").child(itemkey).removeValue();
            self.itemList.remove(at: indexPath.row)
            self.myTable.reloadData()
        }
    }
    func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        print("Inside Segue")
        if (segue.identifier == "edit") {
            //Checking identifier is crucial as there might be multiple
            // segues attached to same view
            let editVC = segue!.destination as! EditViewController;
            editVC.name = "Test";
            editVC.desc = "Desc";
            print("Inside Segue Passed")
        }
    }
    
    
    func fetchList(){
        let eref = FIRDatabase.database().reference().child("My To Do Items")
        var todoitems = ToDoItem()
        eref.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject]  {
                print( "snapshot",snapshot.key)
                todoitems.key = snapshot.key
                todoitems.name = dictionary["Name"] as! String
                todoitems.description = dictionary["Description"] as! String
                todoitems.completed = dictionary["Completed"] as! String
            }
            
            self.itemList.append(todoitems)
            
            DispatchQueue.main.async {
                self.myTable.reloadData()
            }
            
        } , withCancel: nil)
        
    }
}

