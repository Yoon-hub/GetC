//
//  ListParameter.swift
//  NetworkKit
//
//  Created by VP on 12/15/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

public struct ListParameter {
    let pageNumber: String
    let pageSize: String
    let order: String
    let flag: String
    let keyword: String
    
    public init(pageNumber: String, pageSize: String, order: String, flag: String, keyword: String) {
        self.pageNumber = pageNumber
        self.pageSize = pageSize
        self.order = order
        self.flag = flag
        self.keyword = keyword
    }
}
