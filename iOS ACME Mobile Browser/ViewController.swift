//
//  ViewController.swift
//  iOS ACME Mobile Browser
//
//  Created by Kabir Dhillon on 7/23/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, UISearchBarDelegate, WKNavigationDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    var currentPageURL: String = ""
    var webViewList = [WKWebView: String]()
    var selectedWebView: WKWebView?
    var selectedBookmark: String = ""
    
    @IBAction func backButton(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        webView.reload()
    }
    
    // Bonus/adv: bookmark
    @IBAction func bookmarkButton(_ sender: Any) {        
        // Click bookmark from toolbar, present list of bookmarks
        // To add, click add button and this will add the current page user is on.
        // To delete, using swipe to delete (editingStyle == .delete)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        webView.allowsBackForwardNavigationGestures = true
        
        self.webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        // Load Web View
        guard let url = URL(string: "https://www.google.com") else {return}
        let request = URLRequest(url: url)
        webView?.load(request)
        
        webViewList[webView] = currentPageURL
                
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        if let url = URL(string: searchBar.text!){
            let request = URLRequest(url: url)
            webView.load(request)
        }
        else{
            print("Search Bar Error")
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == #keyPath(WKWebView.url) {
            print("### URL:", self.webView.url!)
            currentPageURL = String("\(self.webView.url!)")
        
        }
        if keyPath == #keyPath(WKWebView.estimatedProgress) {
            // When page load finishes. Should work on each page reload.
            if (self.webView.estimatedProgress == 1) {
                print("### EP:", self.webView.estimatedProgress)
                currentPageURL = String("\(self.webView.url!)")
            }
        }
    }
    
    func loadWebView(){
        self.webView.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        // Load Web View
        guard let url = URL(string: "https://www.google.com") else {return}
        let request = URLRequest(url: url)
        webView?.load(request)
        
        webViewList[webView] = currentPageURL
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("loading to segue")
        
        if segue.identifier == "bookmarkSegue"{
            print("bookmark segue")
            let vc = segue.destination as? BookmarkViewController
            vc?.bookmarkURL = currentPageURL
            
            // Selected bookmark
            selectedBookmark = vc!.selectedBookmark
            if (selectedBookmark != ""){
                let url = URL(string: selectedBookmark)
                webView.load(URLRequest(url: url!))
                
                webView.reload()
            }
        }
        /*
        if segue.identifier == "tabsSegue"{
            print("tabs segue")
            let vc = segue.destination as? TabViewController
            vc?.tabs = webViewList
        }
        */
    }
}
