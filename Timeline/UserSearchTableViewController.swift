//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController {

    var userDataSource: [User] = []
    
    var mode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)
        }
    }
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    @IBAction func selectedIndexChanged(sender: UISegmentedControl) {
        updateViewBasedOnMode()
    }
    
    enum ViewMode: Int {
        case Friends
        case All
        
        func users(completion: (users:[User]?) -> Void) {
            switch self {
            case .Friends:
                UserController.followedByUser(UserController.sharedInstance.currentUser, completion: { (followed) -> Void in
                    completion:(users: followed)
                })
            case .All:
                UserController.fetchAllUsers({ (users) -> Void in
                    completion:(users: users)
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewBasedOnMode()
    }
    
    func updateViewBasedOnMode() {
        mode.users { (users) -> Void in
            if let users = users {
                self.userDataSource = users
            } else {
                self.userDataSource = []
            }
            
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("usernameCell", forIndexPath: indexPath)
        
        let user = usersDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        
        return cell
    }



}
