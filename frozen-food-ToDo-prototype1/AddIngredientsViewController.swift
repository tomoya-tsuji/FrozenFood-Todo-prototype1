//
//  AddIngredientsViewController.swift
//  frozen-food-ToDo-prototype1
//
//  Created by 辻朝也 on 2016/09/01.
//  Copyright © 2016年 astrotom. All rights reserved.
//

import UIKit

var todoItem = [String]()
var dateItem = [String]()

let ingredientsDefaults = NSUserDefaults.standardUserDefaults()
let dateDefaults = NSUserDefaults.standardUserDefaults()


class AddIngredientsViewController: UIViewController {
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var addItemButton: UIButton!

    @IBAction func addItemButton(sender: AnyObject) {
        if ((itemTextField.text?.characters.count != 0) && (dateTextField.text?.characters.count != 0)) {
            print("データ保存開始")
            todoItem.append(itemTextField.text!)
            dateItem.append(dateTextField.text!)
            itemTextField.text = ""
            dateTextField.text = ""
            //データ保存と永続化
            ingredientsDefaults.setObject(todoItem, forKey: "todoItem")
            dateDefaults.setObject(dateItem, forKey: "dateItem")
            ingredientsDefaults.synchronize()
            dateDefaults.synchronize()
            print("データ保存終了")
            let alert = UIAlertView()
            alert.title = "食材を追加しました"
            alert.addButtonWithTitle("OK")
            alert.show();

        } else {
            let alert = UIAlertView()
            alert.title = "追加できません"
            alert.message = "全て入力してください"
            alert.addButtonWithTitle("OK")
            alert.show();
        }
    }
    
    @IBAction func clearData(sender: AnyObject) {
        ingredientsDefaults.removeObjectForKey("todoItem")
        dateDefaults.removeObjectForKey("dateItem")
        print("データを初期化しました")
    }
}
