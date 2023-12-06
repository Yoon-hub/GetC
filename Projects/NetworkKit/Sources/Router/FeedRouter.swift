//
//  FeedRouter.swift
//  NetworkKit
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import Alamofire

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

public enum FeedRouter: RouterProtocol {
    case list(listParam: ListParameter)
    
    public var endPoint: String {
        switch self {
        case .list:
            return "post/list"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .list:
            return .get
        }
    }
    
    public var headers: HTTPHeaders {
        switch self {
        case .list:
            return ["Content-Type": "application/json"]
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .list:
            return nil
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case let .list(listParam):
            return [
                URLQueryItem(name: "pageNumber", value: listParam.pageNumber),
                URLQueryItem(name: "pageSize", value: listParam.pageSize),
                URLQueryItem(name: "order", value: listParam.order),
                URLQueryItem(name: "flag", value: listParam.flag),
                URLQueryItem(name: "keyword", value: listParam.keyword)
            ]
        }
    }
}