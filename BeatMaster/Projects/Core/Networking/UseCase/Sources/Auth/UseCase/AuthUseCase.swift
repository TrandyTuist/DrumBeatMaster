//
//  AuthUseCase.swift
//  UseCase
//
//  Created by 서원지 on 4/22/24.
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
        completion: @escaping () -> Void
    ) async {
        await repository.handleAppleLoginResult(result: result, completion: completion)
        
    }
    
    public func getAppleRefreshToken(
        code: String,
        completionHandler: @escaping (String?) -> Void) {
        repository.getAppleRefreshToken(code: code, completionHandler: completionHandler)
    }
    
    
    public func requestKakaoTokenAsync(
        completion: @escaping () -> Void
    ) async {
        await repository.requestKakaoTokenAsync(completion: completion)
    }
    
    public func authModelToReducer(auth: UserAuth) {
        repository.authModelToReducer(auth: auth)
    }
    
    public func getUserInfoKakao(auth: UserAuth) {
        repository.getUserInfoKakao(auth: auth)
    }
    
    public func revokeAppleToken(
        clientSecret: String,
        token: String,
        completionHandler: @escaping () -> Void
    ) async {
        await repository.revokeAppleToken(
            clientSecret: clientSecret,
            token: token, 
            completionHandler: completionHandler
        )
    }
    
    public func unlinkKakao(completionHandler: @escaping () -> Void) async {
        await repository.unlinkKakao(completionHandler: completionHandler)
    }
}

extension AuthUseCase: DependencyKey {
    public static let liveValue: AuthUseCase = {
        let authRepository = DependencyContainer.live.resolve(AuthRepositoryProtocol.self) ?? DefaultAuthRepository()
         return AuthUseCase(repository: authRepository)
       }()
}

public extension DependencyValues {
    var authUseCase: AuthUseCaseProtocol {
        get { self[AuthUseCase.self] }
        set { self[AuthUseCase.self] = newValue as! AuthUseCase}
    }
}


