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
import GetCKit

public final class APIService {
    
    public func apiRequset<T: Decodable>(type: T.Type, router: AuthRouter) async -> T {
        
        Utility.print("✈️Request: \(router.endPoint)")
        Utility.print("✉️Param: \(router.parameters ?? [:])")
        
        return await withCheckedContinuation({ continuation in
            AF.request(router)
                .responseDecodable(of: T.self) { response in
                    Utility.print("📨Response: \(response)")
                    
                    switch response.result {
                    case .success(let result):
                        Utility.print("📨result: \(result)")
                        continuation.resume(returning: result)
                    case .failure(let error):
                        Utility.print("📨Error: \(error)")
                    }
                }
        })
        
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
