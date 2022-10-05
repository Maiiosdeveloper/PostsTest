//
//  Post.swift
//  TestPosts
//
//  Created by fintech on 05/10/2022.
//

import Foundation

// MARK: - Welcome
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

