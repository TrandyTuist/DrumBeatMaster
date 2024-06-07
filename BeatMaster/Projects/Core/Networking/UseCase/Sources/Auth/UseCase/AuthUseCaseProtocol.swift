//
//  AuthUseCaseProtocol.swift
//  UseCase
//
//  Created by 서원지 on 4/22/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import AuthenticationServices
import Model

public protocol AuthUseCaseProtocol {
    func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping () -> Void
    ) async throws
    
    func getAppleRefreshToken(
        code: String,
        completionHandler: @escaping (String?) -> Void
    )
    
    func requestKakaoTokenAsync(
        completion: @escaping () -> Void
    ) async throws
    
    func authModelToReducer(auth: UserAuth)
    
    func getUserInfoKakao(auth: UserAuth) async throws
    
    func revokeAppleToken(
        clientSecret: String,
        token: String,
        completionHandler: @escaping () -> Void
    ) async throws
    
    func unlinkKakao(
        completionHandler: @escaping () -> Void
    ) async throws
}
