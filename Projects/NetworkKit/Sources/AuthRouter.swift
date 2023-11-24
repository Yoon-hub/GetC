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
    case signUp(id: String, pw: String, nickName: String, joinCode: String)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .chkCode(let code):
            return "invite/chk-code/\(code)"
        case .signUp:
            return "member/join"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .chkCode:
            return .get
        case .signUp:
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .chkCode:
            return ["Content-Type" : "application/x-www-form-urlencoded"]
        case .signUp:
            return ["Content-Type" : "application/json"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .chkCode:
            return nil
        case let .signUp(id, pw, nickName, joinCode):
            let parameters: [String: Any] = [
                "memberId": id,
                "password": pw,
                "nickname": nickName,
                "joinCode": joinCode,
                "memberStatus": "0"
            ]
            
            return parameters
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
        case .signUp:
            request = try JSONEncoding.default.encode(request, with: parameters)
        }
        return request
    }
    

}
