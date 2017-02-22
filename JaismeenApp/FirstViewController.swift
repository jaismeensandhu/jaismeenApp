//
//  FirstViewController.swift
//  JaismeenApp
//
//  Created by Apple on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data:[String]=["Test","New","One More"]
    
    @IBOutlet weak var myTable: UITableView!
    
    var quantityCell:[String]=["1","2","3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell=tableView.dequeueReusableCell(withIdentifier: "Row", for: indexPath) as! TaskManager
        
        let item = cell.viewWithTag(1) as! UILabel
        item.text=data[indexPath.row]
        let quantity=cell.viewWithTag(2) as! UILabel
        quantity.text=quantityCell[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.data.remove(at: indexPath.row)
            self.myTable.reloadData()
        }
    }
    
    
    
    var searchResults = [[String : AnyObject]]()
    
    @IBAction func resetBtn(_ sender: UIButton) {
        data = []
        data.removeAll()
        self.myTable.reloadData()
        
    }
    
    
}

