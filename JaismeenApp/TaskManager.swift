//
//  TaskManager.swift
//  JaismeenApp
//
//  Created by Student on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
//

import UIKit

class TaskManager: UITableViewCell {
   
   
    @IBOutlet weak var editbtn: UIButton!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Item: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
   
   @IBAction func changeStatus(_ sender: UISwitch) {
        if sender.isOn==true
        {
            Item.textColor = UIColor.black
            Desc.textColor = UIColor.black
            editbtn.isEnabled=true
           
        }
        else
        {
            Item.textColor = UIColor.lightGray
            Desc.textColor = UIColor.lightGray
             editbtn.isEnabled=false
        }
    }
    
    
    @IBAction func editItem(_ sender: UIButton) {
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
