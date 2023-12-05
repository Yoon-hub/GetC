//
//  EndPoint.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/04.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import Alamofire

let BASE_URL = URL(string: "http://13.209.157.128:8080/api/")!

public enum AuthRouter: RouterProtocol {
    case chkCode(code: String)
    case signUp(id: String, pw: String, nickName: String, joinCode: String)
    case signIn(id: String, pw: String)
    
    public var endPoint: String {
        switch self {
        case .chkCode(let code):
            return "invite/chk-code/\(code)"
        case .signUp:
            return "member/join"
        case .signIn:
            return "member/login"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .chkCode:
            return .get
        case .signUp, .signIn:
            return .post
        }
    }
    
    public var headers: HTTPHeaders {
        switch self {
        case .chkCode:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .signUp, .signIn:
            return ["Content-Type": "application/json"]
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .chkCode:
            return nil
        case let .signUp(id, pw, nickName, joinCode):
            return [
                "memberId": id,
                "password": pw,
                "nickname": nickName,
                "joinCode": joinCode,
                "memberStatus": "0"
            ]
        case .signIn:
            return nil
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .chkCode, .signUp:
            return nil
        case let .signIn(id, pw):
            return [
                URLQueryItem(name: "memberId", value: id),
                URLQueryItem(name: "password", value: pw)
            ]
        }
    }

}
