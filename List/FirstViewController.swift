//
//  FirstViewController.swift
//  List
//
//  Created by mmslab on 2017/2/24.
//  Copyright © 2017年 mmslab. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet var tableview: UITableView!
    
    var items:[String] = []
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
       cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let itemsObject = NSUserDefaults.standardUserDefaults().objectForKey("items")
        
        if let tempitems = itemsObject as? [String]{
            
            items = tempitems
        
        }
        
        tableview.reloadData()

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete{
        
        items.removeAtIndex(indexPath.row)
        
        tableview.reloadData()
        
        NSUserDefaults.standardUserDefaults().setObject(items, forKey: "items")
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

