//
//  TimelineTableViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {

    var posts: [Post] = []
    override func viewWillAppear(animated: Bool) {
        if let currentUser = UserController.sharedInstance.currentUser {
            if posts.count > 0 {
                loadTimelineForUser(currentUser)
            }
        } else {
            tabBarController?.performSegueWithIdentifier("toLoginSignup", sender: nil)
        }
    }
    
    func loadTimelineForUser (user: User) {
        PostController.fetchTimelineForUser(user) { (posts) -> Void in
            if let posts = posts {
                self.posts = posts
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("timelineCell", forIndexPath: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.updateWithPost(post)
        
        return cell
    }


}
