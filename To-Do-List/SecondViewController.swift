//
//  SecondViewController.swift
//  To-Do-List
//
//  Created by Mohak on 25/04/16.
//  Copyright © 2016 Mohak. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var todoItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.todoItem.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddItemCallback(sender: AnyObject) {
        self.view.endEditing(true);
        todoListItems.append(todoItem.text!);
        todoItem.text = ""
        NSUserDefaults.standardUserDefaults().setObject(todoListItems, forKey: "toDoList")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        todoItem.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
    }
}

