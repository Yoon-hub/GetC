//
//  PostCreateDTO.swift
//  NetworkKit
//
//  Created by VP on 12/8/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

// MARK: - PostCreateDTO
public struct PostCreateDTO: Codable {
    public let status, responseCode, code, message: String
    public let data: PostCreateDTODataClass?
}

// MARK: - DataClass
public struct PostCreateDTODataClass: Codable {
    let postID, authorID: Int
    let title, content: String
    let postedAt: [Int]
    let flag, postType: String
    let view: Int
    let updatedAt: [Int]?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case authorID = "authorId"
        case title, content, postedAt, flag, postType, view, updatedAt
    }
}
