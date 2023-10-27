//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 최윤제 on 2023/10/23.
//

import Foundation
import ProjectDescription

let getCKitinfoPlist: [String: Plist.Value] = [:]

let getCKitTargets: [Target] = [
  .init(name: "GetCKit",
        platform: .iOS,
        product: .framework,
        bundleId: "com.getc.getckit",
        deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
        infoPlist: .extendingDefault(with: getCKitinfoPlist),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        dependencies: [])
]

let getCKitproject = Project.init(name: "GetCKit",
                              organizationName: "com.getc",
                              targets: getCKitTargets)
