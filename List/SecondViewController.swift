//
//  SecondViewController.swift
//  List
//
//  Created by mmslab on 2017/2/24.
//  Copyright © 2017年 mmslab. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var TextField: UITextField!
    @IBAction func AddButton(sender: AnyObject) {
        
        let itemsObject = NSUserDefaults.standardUserDefaults().objectForKey("items")
        
        var items:[String]
        
        if let tempitems = itemsObject as? [String]{
            
            items = tempitems
            
            items.append(TextField.text!)
            
        }else{
            
            items = [TextField.text!]
            
        }
        
        NSUserDefaults.standardUserDefaults().setObject(items, forKey: "items")
        
        TextField.text = ""
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        self.view.endEditing(true)
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
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

