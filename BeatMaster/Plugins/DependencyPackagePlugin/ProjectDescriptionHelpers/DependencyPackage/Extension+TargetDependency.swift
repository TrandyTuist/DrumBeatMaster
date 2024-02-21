//
//  Extension+TargetDependency.swift
//  Plugins
//
//  Created by 서원지 on 2/21/24.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let moya = TargetDependency.external(name: "Moya", condition: .none)
    static let combineMoya = TargetDependency.external(name: "CombineMoya", condition: .none)
    static let composableArchitecture = TargetDependency.external(name: "ComposableArchitecture", condition: .none)
    static let swinject = TargetDependency.external(name: "Swinject", condition: .none)
    static let Supabase = TargetDependency.external(name: "Supabase", condition: .none)
}

