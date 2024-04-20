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

    @discardableResult
    public func registerAsync<T>(_ type: T.Type, build: @escaping () async -> T) async  -> Self {
        let key = String(describing: type)
        asyncRegistry[key] = build
        Log.debug("Registered Async", key)
        return self
    }

    public func resolve<T>(_ type: T.Type) -> T? {
        let key = String(describing: type)
        if let factory = registry[key] as? () -> T {
            return factory()
        } else {
            fatalError("No registered dependency found for \(key)")
        }
    }

    public func resolveAsync<T>(_ type: T.Type) async -> T? {
        let key = String(describing: type)
        if let factory = asyncRegistry[key] as? () async -> T {
            return await factory()
        } else {
            Log.error("No registered async dependency found for", key)
            return nil
        }
    }
}

public extension DependencyContainer {
    
    static let live = DependencyContainer()
}
