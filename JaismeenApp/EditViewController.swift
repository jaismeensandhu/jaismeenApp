//
//  EditViewController.swift
//  JaismeenApp
//
//  Created by Jaismeen Sandhu(300877728) on 2017-02-22.
//  Copyright © 2017 proApptive. All rights reserved.
// Edit Item Page

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var editItemDesc: UITextField!
    @IBOutlet weak var editItemName: UITextField!
    var name:String!
    var desc:String!
    
    
    
    @IBAction func updateBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func resetBtn(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        editItemName.text = name;
        editItemDesc.text = desc;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
