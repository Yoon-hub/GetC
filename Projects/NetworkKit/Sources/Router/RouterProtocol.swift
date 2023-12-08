//
//  RouterProtocol.swift
//  NetworkKit
//
//  Created by 윤제 on 12/4/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import Alamofire

public protocol RouterProtocol: URLRequestConvertible {
     var endPoint: String { get }
     var method: HTTPMethod { get }
     var headers: HTTPHeaders { get }
     var parameters: Parameters? { get }
     var queryItems: [URLQueryItem]? {get}
}

extension RouterProtocol {
    public func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(url: BASE_URL.appendingPathComponent(endPoint), resolvingAgainstBaseURL: true)
        
        if let queryItems {
            urlComponents?.queryItems = queryItems
        }
        
        
        guard let url = urlComponents?.url else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = headers
        
        request = try JSONEncoding.default.encode(request, with: parameters) // 파라미터는 URL 쿼리스트링으로 처리
        
        return request
    }
}
