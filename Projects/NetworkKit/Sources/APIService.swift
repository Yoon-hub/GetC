//
//  APIService.swift
//  NetworkKit
//
//  Created by 최윤제 on 2023/11/08.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation
import Combine
import ComposableArchitecture

import Alamofire

public final class APIService {
    
    public func apiRequset<T: Decodable>(type: T.Type, router: AuthRouter) async -> Result<T, Error> {
        let response = AF.request(router).serializingDecodable(T.self)
        
        switch await response.result {
        case .success(let data):
            return .success(data)
        case .failure(let error):
            return .failure(error)
        }
        
    }
}

enum APIServiceKey: DependencyKey {
    static var liveValue: APIService = APIService()
}

extension DependencyValues {
    public var apiService: APIService {
        get { self[APIServiceKey.self] }
        set { self[APIServiceKey.self] = newValue }
    }
}
