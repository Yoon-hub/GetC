//
//  EndPoint.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/04.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

import Alamofire

public enum AuthRouter: URLRequestConvertible {
    case chkCode(code: String)
    case signUp(id: String, pw: String, nickName: String, joinCode: String)
    case signIn(id: String, pw: String)
    
    var baseURL: URL {
        return URL(string: "http://13.209.157.128:8080/api/")!
    }
    
    var endPoint: String {
        switch self {
        case .chkCode(let code):
            return "invite/chk-code/\(code)"
        case .signUp:
            return "member/join"
        case .signIn:
            return "member/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .chkCode:
            return .get
        case .signUp, .signIn:
            return .post
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .chkCode:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        case .signUp, .signIn:
            return ["Content-Type": "application/json"]
        }
    }
    
    var parameters: Parameters? {
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
        case let .signIn(id, pw):
            // Note: 아이디와 비밀번호를 URL 쿼리스트링으로 전달
            return [
                "memberId": id,
                "password": pw
            ]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(endPoint), resolvingAgainstBaseURL: true)
        
        switch self {
        case .signIn(let id, let pw):
            // .signIn 케이스에서는 아이디와 비밀번호를 URL 쿼리스트링으로 추가
            let queryItems = [
                URLQueryItem(name: "memberId", value: id),
                URLQueryItem(name: "password", value: pw)
            ]
            urlComponents?.queryItems = queryItems
        default:
            break
        }
        
        guard let url = urlComponents?.url else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers
        
        switch self {
        case .chkCode:
            request = try URLEncoding.default.encode(request, with: parameters)
        case .signUp, .signIn:
            request = try JSONEncoding.default.encode(request, with: nil) // 파라미터는 URL 쿼리스트링으로 처리
        }
        
        return request
    }
}
