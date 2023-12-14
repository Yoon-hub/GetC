
import Foundation
import ProjectDescription

let spm = SwiftPackageManagerDependencies([
//  .remote(
//    url: "https://github.com/CombineCommunity/CombineExt.git", requirement: .exact("1.8.1")
//  )
    .remote(url: "https://github.com/pointfreeco/swift-composable-architecture.git", requirement: .range(from: "1.0.0", to: "2.0.0")),
    .remote(url: "https://github.com/johnpatrickmorgan/TCACoordinators.git", requirement: .exact("0.8.0")),
    .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .exact("5.8.1")),
    .remote(url: "https://github.com/siteline/swiftui-introspect.git", requirement: .exact("1.1.1"))
])

let dependencies = Dependencies(
    swiftPackageManager: spm,
    platforms: [.iOS]
)
