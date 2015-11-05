//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Sean Chang on 11/4/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var followButton: UIButton!
    
    func updateWithUser(user: User) {
        if let bio = user.bio {
            bioLabel.text = bio
        } else {
            bioLabel.hidden = true
        }
        
        if let url = user.url {
            urlButton.setTitle(url, forState: .Normal)
        } else {
            urlButton.hidden = true
        }
        
        if user == UserController.sharedInstance.currentUser {
            followButton.setTitle("Logout", forState: .Normal)
        } else {
            UserController.userFollowsUser(UserController.sharedInstance.currentUser, follows: user, completion: { (success) -> Void in
                if follows {
                    self.followButton.setTitle("Unfollow", forState: .Normal)
                } else {
                    self.followButton.setTitle("Follow", forState: .Normal)
                }
            })
        }
    }
}
