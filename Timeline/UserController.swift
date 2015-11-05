//
//  UserController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation

class UserController {
    static let sharedInstance = UserController()
    
    var currentUser: User!
    
    init(currentUser: User? = nil) {
        self.currentUser = currentUser
    }
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        completion(user: mockUsers().first)
    }
    
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        completion(users: mockUsers())
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func userFollowsUser(user: User, follows: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func followedByUser(user: User, completion: (followed: [User]?) -> Void) {
        completion(followed: mockUsers())
    }
    
    static func authenticateUser(email: String, password: String, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func createUser(email: String, username: String, password: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers().first)
    }
    
    static func updateUser(user: User, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers().first)
    }
    
    static func logoutCurrentUser() {
        
    }
    
    static func mockUsers() -> [User] {
        let user1 = User(username: "Banana", identifier: "12345")
        let user2 = User(username: "FakeName", identifier: "12346")
        let user3 = User(username: "Billy", identifier: "12347")
        let user4 = User(username: "HelloWorld", identifier: "12348")
        
        return [user1, user2, user3, user4]
    }
    
    
}