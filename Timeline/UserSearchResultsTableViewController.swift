//
//  UserSearchResultsTableViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/4/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class UserSearchResultsTableViewController: UITableViewController {

    var userResultsDataSource: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userResultsDataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userResultsCell", forIndexPath: indexPath)
        
        let user = userResultsDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.presentingViewController?.performSegueWithIdentifier("toProfileView", sender: cell)
    }
    
}
