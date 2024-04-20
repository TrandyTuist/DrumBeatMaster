//
//  AppDIContainer.swift
//  BeatMaster
//
//  Created by 서원지 on 1/16/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Networkings
import DiContainer
import Auth

public final class AppDIContainer {
    public static let shared: AppDIContainer = .init()

    private let diContainer: DependencyContainer = .live
    
    private init() {
    }

    public func registerDependencies() async {
        await registerRepositories()
        await registerUseCases()
    }
    
    // MARK: - Use Cases
    private func registerUseCases() async {
        await registerAuthUseCase()
    }
    
    private func registerAuthUseCase() async {
        await diContainer.registerAsync(AuthUseCaseProtocol.self) {
            guard let repository = await self.diContainer.resolveAsync(AuthRepositoryProtocol.self) else {
                assertionFailure("AuthRepositoryProtocol must be registered before registering AuthUseCaseProtocol")
                return AuthUseCase(repository: DefaultAuthRepository()) // Fallback to a default repository
            }
            return AuthUseCase(repository: repository)
        }
    }
    
    // MARK: - Repositories Registration
    private func registerRepositories() async {
        await registerAuthRepositories()
    }
    
    private func registerAuthRepositories() async {
        await diContainer.registerAsync(AuthRepositoryProtocol.self) {
            AuthRepository()
        }
    }
}

