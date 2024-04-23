//
//  AuthRepositoryProtocol.swift
//  UseCase
//
//  Created by 서원지 on 4/22/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import AuthenticationServices
import Model

public protocol AuthRepositoryProtocol {
    
    func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping () -> Void
    ) async
    
    func getAppleRefreshToken(
        code: String,
        completionHandler: @escaping (String?) -> Void
    ) 
    
        
    func requestKakaoTokenAsync(
        completion: @escaping () -> Void
    ) async
    
    func authModelToReducer(auth: UserAuth)
    
    func getUserInfoKakao(auth: UserAuth)
    
    func revokeAppleToken(
        clientSecret: String,
        token: String, 
        completionHandler: @escaping () -> Void
    ) async
    
    func unlinkKakao(
        completionHandler: @escaping () -> Void
    ) async
    
}
