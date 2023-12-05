//
//  File.swift
//  GetC
//
//  Created by 윤제 on 12/5/23.
//  Copyright © 2023 com.getc. All rights reserved.
//

import Foundation

public struct FeedItem: Identifiable, Equatable {
    
    public var id: Int
    
    //let PostId: Int
    public let title: String
    public let content: String
    public let authorID: Int
    public let postedAt: Date?
    public let updatedAt: Date?
    public let view: Int
}
