//
//  ProfileViewController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController, UICollectionViewDataSource, ProfileHeaderCollectionReusableViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    var user: User?
    var userPosts: [Post] = []
    
    func updateBasedOnUser() {
        guard let user = user else {return}
        
        title = user.username
        
        PostController.postsForUser(user) { (posts) -> Void in
            if let posts = posts {
                self.userPosts = posts
            } else {
                self.userPosts = []
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.collectionView.reloadData()
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if user == nil {
            user = UserController.sharedInstance.currentUser
            editBarButton.enabled = true
        }
        
        updateBasedOnUser()
    }
    
    override func viewDidAppear(animated: Bool) {
         super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Collection View
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let post = userPosts[indexPath.item]
        
        cell.updateWithImageIdentifier(post.imageEndPoint)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "profileHeaderView", forIndexPath: indexPath) as! ProfileHeaderCollectionReusableView
        
        headerView.delegate = self
        headerView.updateWithUser(user!)
        
        
        return headerView
    }
    
    // MARK: Profile header delegate
    
    func userTappedFollowActionButton() {
        guard let user = user else {return}
        
        if user == UserController.sharedInstance.currentUser {
            
            UserController.logoutCurrentUser()
            tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
            
        } else {
            UserController.userFollowsUser(UserController.sharedInstance.currentUser, follows: user) { (follows) -> Void in
                
                if follows {
                    UserController.unfollowUser(self.user!, completion: { (success) -> Void in
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.updateBasedOnUser()
                        })
                    })
                } else {
                    UserController.followUser(self.user!, completion: { (success) -> Void in
                        
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.updateBasedOnUser()
                        })
                    })
                }
            }
        }
    }
    
    func userTappedURLButton() {
        if let profileURL = NSURL(string: user!.url!) {
            let safariViewController = SFSafariViewController(URL: profileURL)
            presentViewController(safariViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editUser" {
            let destinationViewController = segue.destinationViewController as? LoginSignupViewController
            
            _ = destinationViewController?.view
            
            destinationViewController?.updateWithUser(user!)
        } else if segue.identifier == "profileToPostDetail" {
            if let cell = sender as? UICollectionViewCell, let indexPath = collectionView.indexPathForCell(cell) {
                
                let post = userPosts[indexPath.item]
                
                let destinationViewController = segue.destinationViewController as? PostDetailTableViewController
                
                destinationViewController?.post = post
            }
        }
    }
}
