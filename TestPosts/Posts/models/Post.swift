//
//  Post.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation

struct Welcome: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}

// MARK: - Post
struct Post: Codable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}

