// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "ReactorKit": .framework,
            "Moya": .framework,
            "RxMoya": .framework,
            "ReactiveMoya": .framework,
            "CombineMoya": .framework,
            "Alamofire": .framework,
        ], baseSettings: .settings(configurations: [
            .debug(name: .debug),
            .release(name: .release)
        
        ])
    )
#endif

let package = Package(
    name: "DDDAttendance",
    dependencies: [
        .package(url: "http://github.com/pointfreeco/swift-composable-architecture", from: "1.10.4"),
        .package(url: "https://github.com/Moya/Moya.git", from: "15.0.3"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0"),
        .package(url: "https://github.com/Kitura/Swift-JWT.git", from: "4.0.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
        .package(url: "https://github.com/kakao/kakao-ios-sdk", from: "2.21.0"),
        
        
        
    ]
)
