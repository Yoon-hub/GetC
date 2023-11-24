//
//  ServerErrorCode.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/07.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

public enum ServerErrorCode: String {
    case validCode = "0000"
    case invalidCode = "9999"
    case expiredCode = "0020"
    case unexistCode = "0021"
    
    var description: String {
        switch self {
        case .validCode:
            return "유요한 코드"
        case .invalidCode:
            return "유요하지 않은 코드"
        case .expiredCode:
            return "만료된 코드"
        case .unexistCode:
            return "이미 사용된 코드"
        }
    }
}
