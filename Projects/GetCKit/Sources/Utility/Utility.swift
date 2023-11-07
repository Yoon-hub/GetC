//
//  Utility.swift
//  GetCKit
//
//  Created by 최윤제 on 2023/11/02.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

public final class Utility {
    
    public static func print<T>(_ log: T) {
        #if DEBUG
        Swift.print("🔧 \(log)")
        #endif
    }
}

