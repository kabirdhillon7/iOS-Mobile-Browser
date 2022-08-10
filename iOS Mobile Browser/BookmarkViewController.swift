//
//  BookmarkViewController.swift
//  iOS ACME Mobile Browser
//
//  Created by Kabir Dhillon on 8/1/22.
//

import UIKit
import Foundation

class BookmarkViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bookmarkTV: UITableView!
    var bookmarks = [String]()
    var bookmarkURL: String = ""
    
    var selectedBookmark: String = ""
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookmarkTV.dataSource = self
        bookmarkTV.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookmarkTV.dequeueReusableCell(withIdentifier: "bookmarkCell") as! BookmarkCell
        
        let bookmarksObj = userDefaults.object(forKey: "BookmarkKey") as? [String]
        cell.bookmarkNameLabel?.text = bookmarksObj?[indexPath.row]

        return cell
    }
    
    // Add a bookmark
    @IBAction func addBookmarkButton(_ sender: Any) {
        // If button is pressed
        // We're going to append the current url to the end of our list of bookmarks
        //bookmarks.append(String: bookmarkURL)
        bookmarks.append(bookmarkURL)
        print("Updating current URL in Bookmarks with: ",bookmarkURL)
        bookmarkTV.reloadData()
        print("Bookmark added")
        userDefaults.set(bookmarks, forKey: "BookmarkKey")
    }
    
    // Remove a bookmark
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            bookmarks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            print("Bookmark removed")
            userDefaults.set(bookmarks, forKey: "BookmarkKey")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedBookmark = bookmarks[indexPath.row]
    }
    

}
