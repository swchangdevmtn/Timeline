//
//  PostController.swift
//  Timeline
//
//  Created by Sean Chang on 11/3/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    static func fetchTimelineForUser(user: User, completion: (posts: [Post]?) -> Void) {
        completion(posts: mockPosts())
    }
    
    static func addPost(image: UIImage, caption: String?, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().first)
    }
    
    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        completion(post: mockPosts().first)
    }
    
    static func postsFromUser(user: User, completion: (posts: [Post]?) -> Void) {
        completion(posts: mockPosts())
    }
    
    static func deletPost(post: Post, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func addCommentWithTextToPost(text: String, post: Post, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func deleteComment(comment: Comment, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().first)
    }
    
    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().first)
    }
    
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts().first)
    }
    
    static func orderPosts(posts: [Post]) -> [Post] {
        return posts.sort({$0.0.identifier > $0.1.identifier})
    }
    
    static func mockPosts() -> [Post] {
        
        let sampleImageIdentifier = "-K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "Banana", postIdentifier: "5432")
        let like2 = Like(username: "FakeName", postIdentifier: "5433")
        let like3 = Like(username: "HelloWorld", postIdentifier: "5434")
        
        let comment1 = Comment(username: "Banana", postIdentifier: "5433", text: "I love bananas")
        let comment2 = Comment(username: "FakeName", postIdentifier: "5432", text: "I'm so real")
        
        let post1 = Post(username: "Banana", identifier: "5432", imageEndPoint: sampleImageIdentifier, caption: "Bananas are gr8", comments: [comment1], likes: [like1, like3])
        let post2 = Post(username: "FakeName", identifier: "5434", imageEndPoint: sampleImageIdentifier, caption: "Real person posting here", comments: [comment1, comment2], likes: [like2])
        
        return [post1, post2]
    }
}