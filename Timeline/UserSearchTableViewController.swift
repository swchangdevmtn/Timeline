//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {

    var userDataSource: [User] = []
    
    var mode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
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
                    completion(users: followed)
                })
            case .All:
                UserController.fetchAllUsers({ (users) -> Void in
                    completion(users: users)
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewBasedOnMode()
        setUpSearchController()
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
    
    var searchController: UISearchController!
    
    func setUpSearchController() {
        
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UserSearchResultsTableViewController")
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString
        
        let resultsViewController = searchController.searchResultsController as! UserSearchResultsTableViewController
        
        resultsViewController.userResultsDataSource = userDataSource.filter({$0.username.lowercaseString.containsString(searchTerm)})
        resultsViewController.tableView.reloadData()
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
        
        let user = userDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        
        return cell
    }
    
    // MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toProfileView" {
            guard let cell = sender as? UITableViewCell else { return }
            if let indexPath = tableView.indexPathForCell(cell) {
                let user = userDataSource[indexPath.row]
                let destinationViewController = segue.destinationViewController as? ProfileViewController
                destinationViewController?.user = user
                
            } else if let indexPath = (searchController.searchResultsController as? UserSearchResultsTableViewController)?.tableView.indexPathForCell(cell) {
                let user = (searchController.searchResultsController as! UserSearchResultsTableViewController).userResultsDataSource[indexPath.row]
                
                let destinationViewController = segue.destinationViewController as? ProfileViewController
                destinationViewController?.user = user
            }
        }
    }


}
