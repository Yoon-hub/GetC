//
//  ChkCodeDTO.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/07.
//  Copyright © 2023 com.getc. All rights reserved.
//
import Foundation

// MARK: - RandomUser
public struct ChkCodeDTO: Codable {
   public let status, responseCode, code, message: String
    public let data: DataClass?
}

// MARK: - DataClass
public struct DataClass: Codable {
    let inviteID, userID: Int
    let inviteCode, isUsed: String
    let createdAt: [Int]
    //let updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case inviteID = "inviteId"
        case userID = "userId"
        case inviteCode, isUsed, createdAt
    }
}
