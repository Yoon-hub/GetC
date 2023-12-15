//
//  CodeListDTO.swift
//  NetworkKit
//
//  Created by 윤제 on 12/15/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

// MARK: - CodeListDTO
public struct CodeListDTO: Codable {
    public let status, responseCode, code, message: String
    public let data: [Datum]
}

// MARK: - Datum
public struct Datum: Codable {
    let inviteID, userID: Int
    public let inviteCode, isUsed: String
    let createdAt: [Int]
    let updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case inviteID = "inviteId"
        case userID = "userId"
        case inviteCode, isUsed, createdAt, updatedAt
    }
}
