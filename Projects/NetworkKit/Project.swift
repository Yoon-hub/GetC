//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 최윤제 on 2023/10/23.
//

import Foundation
import ProjectDescription

let netwrokKitinfoPlist: [String: Plist.Value] = [:]

let netwrokKitTargets: [Target] = [
  .init(name: "NetworkKit",
        platform: .iOS,
        product: .framework,
        bundleId: "com.getc.netwrokkit",
        deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
        infoPlist: .extendingDefault(with: netwrokKitinfoPlist),
        sources: ["Sources/**"],
        dependencies: [
            .external(name: "Alamofire")
        ])
]

let netwrokKitproject = Project.init(name: "NetworkKit",
                              organizationName: "com.getc",
                              targets: netwrokKitTargets)
