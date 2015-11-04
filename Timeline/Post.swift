//
//  Post.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

struct Post: Equatable {
    var imageEndPoint: String
    var caption: String?
    let username: String
    var comments: [Comment]
    var likes: [Like]
    var identifier: String?
    
    init(username: String, identifier: String, imageEndPoint: String, caption: String? = nil, comments: [Comment] = [], likes: [Like] = []) {
        
        self.username = username
        self.identifier = identifier
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.comments = comments
        self.likes = likes
        
    }
}

func ==(lhs: Post, rhs: Post) -> Bool {
    
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}