//
//  EndPoint.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/04.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import Alamofire

let BASE_URL = "http://13.209.157.128:8080/api/"

public enum AuthRouter: URLRequestConvertible {
    case chkCode(code: String)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .chkCode(let code):
            return "invite/chk-code/\(code)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .chkCode:
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .chkCode:
            return ["Content-Type" : "application/x-www-form-urlencoded"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .chkCode:
            return nil
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers
        
        switch self {
        case .chkCode:
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
    

}
