//
//  FirstViewController.swift
//  To-Do-List
//
//  Created by Mohak on 25/04/16.
//  Copyright © 2016 Mohak. All rights reserved.
//

import UIKit

var todoListItems = [String]()

class FirstViewController: UIViewController,UITableViewDelegate {

    @IBOutlet weak var todoListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            todoListItems = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoListItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoListItems[indexPath.row]
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        todoListView.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        todoListItems.removeAtIndex(indexPath.row)
        todoListView.reloadData()
    }

}

