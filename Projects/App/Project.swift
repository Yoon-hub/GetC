//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 최윤제 on 2023/10/23.
//

import Foundation
import ProjectDescription

let infoPlist: [String: Plist.Value] = [:]

let appTargets: [Target] = [
  .init(name: "GetC",
        platform: .iOS,
        product: .app,
        bundleId: "com.getc.app",
        deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone]),
        infoPlist: .extendingDefault(with: infoPlist),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        dependencies: [
          .project(target: "GetCKit", path: "../GetCKit"),
          .project(target: "NetworkKit", path: "../NetworkKit")
        ])
]

let appproject = Project.init(name: "GetC",
                              organizationName: "com.getc",
                              targets: appTargets)
