//
//  DefaultDTO.swift
//  NetworkKit
//
//  Created by 윤제 on 12/21/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

public struct DefaultDTO<T: Codable>: Codable {
    public let status, responseCode, code, message: String
    public let data: T?
}
