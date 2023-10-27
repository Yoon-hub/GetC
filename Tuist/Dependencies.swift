
import Foundation
import ProjectDescription

let spm = SwiftPackageManagerDependencies([
//  .remote(
//    url: "https://github.com/CombineCommunity/CombineExt.git", requirement: .exact("1.8.1")
//  )
])

let dependencies = Dependencies(
    swiftPackageManager: spm,
    platforms: [.iOS]
)
