//
//  SecondViewController.swift
//  JaismeenApp
//
//  Created by Apple on 2017-02-21.
//  Copyright © 2017 proApptive. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {

  
    
    @IBOutlet weak var Desc: UITextField!
    @IBOutlet weak var Item: UITextField!
    
    
    //var todoitem:[String]=[]
    //var desc:[String]=[]
    @IBAction func submit(_ sender: UIButton) {
            
        var ref=FIRDatabase.database().reference().child("My ToDo List")
        let newRef=ref.childByAutoId()
        newRef.setValue(Item.text)
        newRef.setValue(Desc.text)
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

