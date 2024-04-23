//
//  Dependencies.swift
//  Manifests
//
//  Created by 서원지 on 1/6/24.
//

import Foundation
import ProjectDescription

let swiftpackage = SwiftPackageManagerDependencies(
    [
        .remote(url: "http://github.com/pointfreeco/swift-composable-architecture", requirement: .exact("1.9.3")),
        .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMinor(from: "15.0.3")),
//        .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .upToNextMajor(from: "2.8.5")),
        .remote(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", requirement: .upToNextMajor(from: "2.0.0")),
        .remote(url: "https://github.com/Kitura/Swift-JWT.git", requirement: .branch("master")),
//        .remote(url: "https://github.com/firebase/firebase-ios-sdk.git", requirement: .upToNextMajor(from: "10.22.0")),
        .remote(url: "https://github.com/kishikawakatsumi/KeychainAccess", requirement: .upToNextMajor(from: "4.2.2")),
        .remote(url: "https://github.com/kakao/kakao-ios-sdk", requirement: .upToNextMajor(from: "2.21.0")),
//        .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.24.0"))

    ],
    productTypes: [
        "ReactorKit": .framework,
        "Moya": .framework,
        "RxMoya": .framework,
        "ReactiveMoya": .framework,
        "CombineMoya": .framework,
        "Alamofire": .framework,
      ],
    baseSettings: .settings(
       configurations: [
         .debug(name: .debug),
         .release(name: .release)
       ]
     )
)

let dependencies = Dependencies(
    swiftPackageManager: swiftpackage,
    platforms: [.iOS]
)



