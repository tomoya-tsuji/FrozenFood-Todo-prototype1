//
//  WebViewController.swift
//  frozen-food-ToDo-prototype1
//
//  Created by 辻朝也 on 2016/09/01.
//  Copyright © 2016年 astrotom. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // loadURL関数を定義する
    func loadURL() {
        // AppDelegateクラスのメンバー変数を参照する
        var app:AppDelegate =
        (UIApplication.sharedApplication().delegate as! AppDelegate)
        let query = app.searchBar
        // 日本語のクエリをエンコード
        let searchword = query!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        // urlを作成
        let targetURL: String = "https://cookpad.com/search/" + searchword!
        let requestURL = NSURL(string: targetURL)
        let request = NSURLRequest(URL: (requestURL)!)
        // urlを叩いて、ロードする
        webview.loadRequest(request)
    }
    
    @IBAction func backVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
