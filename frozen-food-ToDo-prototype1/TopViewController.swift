//
//  TopViewController.swift
//  frozen-food-ToDo-prototype1
//
//  Created by 辻朝也 on 2016/09/01.
//  Copyright © 2016年 astrotom. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
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
        
        // searchBarの情報を受け取るためのdelegateを設定
        searchBar.delegate = self
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
    
    // MARK: searchBar
    
    //テキストが変更される毎に呼ばれる
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    //Cancelボタンが押された時に呼ばれる
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    }
    
    //Searchボタンが押された時に呼ばれる
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        // AppDelegateクラスのメンバー変数を参照する
        var app:AppDelegate =
        (UIApplication.sharedApplication().delegate as! AppDelegate)
        app.searchBar = searchBar.text
        // webviewへ遷移
        let secondViewController: WebViewController = self.storyboard?.instantiateViewControllerWithIdentifier("webVC") as! WebViewController
        self.presentViewController(secondViewController, animated: true, completion: nil)
        // キーボードを閉じる
        self.view.endEditing(true)
    }


}

