//
//  Like.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

struct Like: Equatable {
    let username: String
    var postIdentifier: String
    var identifier: String?
    
    init(username: String, postIdentifier: String, identifier: String? = nil) {
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
}

func ==(lhs: Like, rhs: Like) -> Bool {
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}