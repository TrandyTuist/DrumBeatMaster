//
//  DIContainer.swift
//  BeatMaster
//
//  Created by 서원지 on 2024/01/16
//  Copyright © 2024 Team.hae.jo, All rights reserved.
//

import Foundation
import Service
import OSLog

public final class DependencyContainer {
    private var registry = [String: Any]()
    private var asyncRegistry = [String: () async -> Any]()

    public init() { }

    @discardableResult
    public func register<T>(_ type: T.Type, build: @escaping () -> T) async -> Self {
        let key = String(describing: type)
        registry[key] = build
        Log.debug("Registered", key)
        return self
    }

    public func resolve<T>(_ type: T.Type)  -> T? {
        let key = String(describing: type)
        if let factory = registry[key] as? () -> T {
            return factory()
        } else {
            fatalError("No registered dependency found for \(key)")
        }
    }
}

public extension DependencyContainer {
    
    static let live = DependencyContainer()
}
