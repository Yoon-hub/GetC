//
//  FeedListDTO.swift
//  NetworkKit
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

// MARK: - FeedListDTO
public struct FeedListDTO: Codable {
    public let status, responseCode, code, message: String
    public let data: FeedListDataClass?
}

// MARK: - DataClass
public struct FeedListDataClass: Codable {
    public let content: [Content]
    public let pageable: Pageable
    public let totalPages, totalElements: Int
    public let last: Bool
    public let size, number: Int
    public let sort: Sort
    public let numberOfElements: Int
    public let first, empty: Bool
}

// MARK: - Content
public struct Content: Codable {
    public let postID, authorID: Int
    public let title, content: String
    public let postedAt: [Int]
    public let flag, postType: String
    public let view: Int
    public let updatedAt: JSONNull?

    public enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case authorID = "authorId"
        case title, content, postedAt, flag, postType, view, updatedAt
    }
}

// MARK: - Pageable
public struct Pageable: Codable {
    let pageNumber, pageSize: Int
    let sort: Sort
    let offset: Int
    let unpaged, paged: Bool
}

// MARK: - Sort
public struct Sort: Codable {
    let empty, sorted, unsorted: Bool
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
