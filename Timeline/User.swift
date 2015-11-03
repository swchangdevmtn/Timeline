//
//  User.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

struct User: Equatable {
    let username: String
    var bio: String?
    var url: String?
    var identifier: String?
    
    init(username: String, identifier: String, bio: String? = nil, url: String? = nil) {
        
        self.username = username
        self.bio = bio
        self.url = url
        self.identifier = identifier
        
    }
}

func ==(lhs: User, rhs: User) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}