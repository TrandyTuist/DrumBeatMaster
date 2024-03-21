//
//  AuthUseCase.swift
//  Auth
//
//  Created by 서원지 on 3/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya
import AuthenticationServices
import Model
import DiContainer
import ComposableArchitecture

public struct AuthUseCase: AuthUseCaseProtocol  {
    
    
    private let repository: AuthRepositoryProtocol
    
    public init(
        repository: AuthRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    
    //MARK: -  애플 로그인
    public func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        nonce: String,
        completion: @escaping () -> Void
    ) async {
        await repository.handleAppleLoginResult(result: result, nonce: nonce, completion: completion)
        
    }
    
    public func getAppleRefreshToken(
        code: String,
        completionHandler: @escaping (String?) -> Void) {
        repository.getAppleRefreshToken(code: code, completionHandler: completionHandler)
    }
    
    public func handleAppleLoginWithFirebase(
        credential: ASAuthorizationAppleIDCredential,
        nonce: String,
        completion: @escaping () -> Void) async {
           await repository.handleAppleLoginWithFirebase(
            credential: credential,
            nonce:  nonce,
            completion: completion)
    }
}

extension AuthUseCase: DependencyKey {
    public static let liveValue: AuthUseCase = {
           let authRepository = DIContainer.container.resolve(AuthRepositoryProtocol.self) ?? DefaultAuthRepository()
           return AuthUseCase(repository: authRepository)
       }()
}

public extension DependencyValues {
    var authUseCase: AuthUseCaseProtocol {
        get { self[AuthUseCase.self] }
        set { self[AuthUseCase.self] = newValue as! AuthUseCase}
    }
}


