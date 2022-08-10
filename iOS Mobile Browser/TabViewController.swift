//
//  TabViewController.swift
//  iOS ACME Mobile Browser
//
//  Created by Kabir Dhillon on 8/1/22.
//

import UIKit
import WebKit


class TabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tabTV: UITableView!
    var tabs = [WKWebView: String?]()
    var webViewArray = [webViews]()
        
    struct webViews {
            var uv : WKWebView!
            var uvURL : String!
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabTV.dataSource = self
        tabTV.delegate = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabTV.dequeueReusableCell(withIdentifier: "tabCell") as! TabCell
        
        //String webUrl = tabs[indexPath.row].getUrl()
        
        cell.tabWebLabel?.text = webViewArray[indexPath.row].uvURL
        //print("name", bookmarkName, "cell:", cell.bookmarkNameLabel?.text)

        return cell
    }
    

}
