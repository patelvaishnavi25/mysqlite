//
//  ViewController.swift
//  mysqlitedemo
//
//  Created by Vaishnavi Patel on 07/10/18.
//  Copyright © 2018 Vaishnavi Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtemp_id: UITextField!
    
    @IBOutlet weak var txtemp_name: UITextField!
    
    @IBOutlet weak var txtemp_add: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let obj = custcell();
        
        var arr = obj.GetData(str: "select* from tblemp");
        
        print(arr);
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func Insert(_ sender: Any) {
        
        let strquery = "insert into tblemp(emp_name,emp_add)values('\(txtemp_name.text!)','\(txtemp_add.text!)')";
        
        let obj = custcell();
        
        var op = obj.dml(str: strquery);
        
        if op == true {
            print("success");
        }
        else
        {
            print("not");
        }
    }
    
    @IBAction func Update(_ sender: Any) {
        let strquery = "insert into tblemp(emp_name,emp_add)values('\(txtemp_name.text!)','\(txtemp_add.text!)')";
        
        let obj = custcell();
        
        var op = obj.dml(str: strquery);
        
        if op == true {
            print("success");
        }
        else
        {
            print("not");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

