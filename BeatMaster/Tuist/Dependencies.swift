//
//  Dependencies.swift
//  Manifests
//
//  Created by 서원지 on 1/6/24.
//

import Foundation
import ProjectDescription

let swiftpackage = SwiftPackageManagerDependencies([
    .remote(url: "http://github.com/pointfreeco/swift-composable-architecture", requirement: .exact("1.8.0")),
    .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMinor(from: "15.0.0")),
    .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .upToNextMajor(from: "2.8.4"))
//    .remote(url: "https://github.com/supabase-community/supabase-swift.git", requirement: .exact("2.0.0"))
    
])

let dependencie = Dependencies(
    swiftPackageManager: swiftpackage,
    platforms: [.iOS]
)



