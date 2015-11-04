//
//  Comment.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

struct Comment: Equatable {
    let username: String
    var postIdentifier: String
    var identifier: String?
    var text: String
    
    init(username: String, postIdentifier: String, identifier: String? = nil, text: String) {
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
        self.text = text
    }
}

func ==(lhs: Comment, rhs: Comment) -> Bool {
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}