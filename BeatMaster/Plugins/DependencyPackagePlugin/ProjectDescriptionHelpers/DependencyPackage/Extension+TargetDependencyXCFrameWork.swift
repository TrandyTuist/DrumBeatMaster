//
//  Extension+TargetDependencyXCFrameWork.swift
//  DependencyPackagePlugin
//
//  Created by 서원지 on 4/19/24.
//

import ProjectDescription

public extension TargetDependency.XCFrameWork {
    static let swinject = TargetDependency.xcframework(path: "FrameWork/Swinject.xcframework", status: .optional, condition: .none)
}
