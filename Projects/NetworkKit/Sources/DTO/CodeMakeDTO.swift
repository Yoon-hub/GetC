//
//  CodeMakeDTO.swift
//  NetworkKit
//
//  Created by VP on 12/15/23.
//  Copyright © 2023 com.getc. All rights reserved.
//
import Foundation

// MARK: - CodeListDTO
public struct CodeMakeDTO: Codable {
    public let status, responseCode, code, message: String
    public let data: CodeMakeData?
}

// MARK: - DataClass
public struct CodeMakeData: Codable {
    public let inviteID, userID: Int
    public let inviteCode, isUsed: String
    public let createdAt: [Int]
    public let updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case inviteID = "inviteId"
        case userID = "userId"
        case inviteCode, isUsed, createdAt, updatedAt
    }
}
