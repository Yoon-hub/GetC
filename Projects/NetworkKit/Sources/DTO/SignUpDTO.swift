//
//  SignUpDTO.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/22.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

// MARK: - Join
public struct SignUpDTO: Codable {
    public let status, responseCode, code, message: String
    public let data: SignUpDTOData?
}

// MARK: - DataClass
public struct SignUpDTOData: Codable {
    let userID: Int
    let memberID, password, nickname: String
    let joinDate: [Int]
    let joinCode, memberStatus: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case memberID = "memberId"
        case password, nickname, joinDate, joinCode, memberStatus
    }
}
