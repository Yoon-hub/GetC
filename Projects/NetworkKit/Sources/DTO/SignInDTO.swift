//
//  SignInDTO.swift
//  NetworkKit
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//
import Foundation

// MARK: - SignInDTO
public struct SignInDTO: Codable {
    public let status, responseCode, code, message: String
    public let data: SignInDataClass?
}

// MARK: - DataClass
public struct SignInDataClass: Codable {
    public let userID: Int
    public let memberID, password, nickname: String
    public let joinDate: [Int]
    public let joinCode, memberStatus: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case memberID = "memberId"
        case password, nickname, joinDate, joinCode, memberStatus
    }
}
