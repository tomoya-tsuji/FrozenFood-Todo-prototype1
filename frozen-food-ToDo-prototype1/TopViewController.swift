//
//  TopViewController.swift
//  frozen-food-ToDo-prototype1
//
//  Created by 辻朝也 on 2016/09/01.
//  Copyright © 2016年 astrotom. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var todolistTable: UITableView!
    @IBAction func back(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            todoItem = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("dateList") != nil {
            dateItem = NSUserDefaults.standardUserDefaults().objectForKey("dateList") as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // mark: tableView
    override func viewDidAppear(animated: Bool) {
        todolistTable.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell") as! CustomTableViewCell
        cell.ingredientsLabel.text = todoItem[indexPath.row]
        cell.dateLabel.text = dateItem[indexPath.row]
        print(todoItem[indexPath.row])
        print(cell.ingredientsLabel.text)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    // アイテムをスライドして消すやつ
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete{
            todoItem.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(todoItem, forKey: "todoList")
            todolistTable.reloadData()
        }
    }


}

