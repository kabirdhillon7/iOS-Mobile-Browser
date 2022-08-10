# Web Browser

Web Browser is an app that allows users to load web pages using WKWebView.

## User Stories
`TODO://` In the **User Stories section below**, add an `x` in the `-[ ]` like this `- [x]` for any user story you complete. (🚫 Remove this paragraph after checking off completed user stories)

### Features
- [X] URL entry field using Bookmark
- [X] WKWebView
- [X] Back Navigation Button
- [X] Forward Navigation Button
- [X] Refresh WKWebView 

### Any additional features you implemented: Bookmarks
The additional feature I added was a list of Bookmarks. I used a view modally to present a table view of bookmark which I user can add their current bookmark using an add button.

I also included a stylized app icon and launch screen; and the graphics were created using Canva. 

### Your approach to the product, including any design decisions or tradeoffs you made
The approach I took was to present a web browser that was familiar to users, using a similar layout to most web browsers with having a search bar using a UISearchBar at the top, followed with a web view using WKWebView, and a toolbar at the bottom where each navigation feature (back, forward, reload, bookmark, tab) had its own individual item buttom

For the search bar, I used the resignFirstResponder to get functionality to enter a url and go to that page (where the web view is now updated). For the forward, back, and reload- I used instance methods that engaged the navigation back-forward list.

For the bookmarks, I created a new view with table view which will diplay all bookmarks users add using the add bookmark button. I used a button so that a user can choose which webpage they want to add to their bookmarks list. Since we're keeping track of the current url, we pass that to our BookmarkViewController once the bookmark button is pressed, so that if a user chooses to add that current page to their bookmarks- we can do so. Each tableview cell includes the url of the (current) website added to bookmarks. If a user chooses to select a site from bookmarks, that site will be updated to the webview in the ViewController.

For the tabs, I choose to store the WKWebViews using an array, so that we are able to access and store them easily. To access a tab, we use a similar approach with a tableview like th bookmarks.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF
`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="YOUR_GIF_URL_HERE" width=250><br>

### Notes
Describe any challenges encountered while building the app.

