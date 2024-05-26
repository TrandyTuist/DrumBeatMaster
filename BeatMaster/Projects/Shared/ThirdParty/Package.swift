//
//  Package.swift
//  ThirdPartyManifests
//
//  Created by 서원지 on 5/21/24.
//

import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "ReactorKit": .framework,
            "Moya": .framework,
            "RxMoya": .framework,
            "ReactiveMoya": .framework,
            "CombineMoya": .framework,
            "Alamofire": .framework,
        ],  baseSettings: .settings(
            configurations: [
              .debug(name: .debug),
              .release(name: .release)
            ]
          ),
        
        platforms: [.iOS]
    )
#endif

let package = Package(
    name: "PackageName",
    dependencies: [
        
        .package(url: "http://github.com/pointfreeco/swift-composable-architecture", .upToNextMinor(from: "1.10.4")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMinor(from: "15.0.3")),
        
    ]
)
