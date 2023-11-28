//
//  UserDefaultsWapper.swift
//  GetCKit
//
//  Created by 최윤제 on 2023/11/14.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue: T {
        get {
            // Read value from UserDefaults
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            // Set value to UserDefaults
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

public struct UserDefaultWrapper {
    @UserDefault(key: "pinNumber", defaultValue: "")
    static public var pinNumber: String
}

