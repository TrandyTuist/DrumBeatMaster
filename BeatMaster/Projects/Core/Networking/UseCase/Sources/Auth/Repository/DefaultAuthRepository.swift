//
//  DefaultAuthRepository.swift
//  UseCase
//
//  Created by 서원지 on 4/22/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import AuthenticationServices
import Model

public final class DefaultAuthRepository : AuthRepositoryProtocol {
    
    public init() {}
    
    public func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping () -> Void)  {
        
    }
    
    public func getAppleRefreshToken(
        code: String,
        completionHandler: @escaping (String?) -> Void) {
            
        }
    
    
    public func requestKakaoTokenAsync(
        completion: @escaping () -> Void
    ) async {
        
    }
    
    public func authModelToReducer(auth: UserAuth)  {
        
    }
    
    public func getUserInfoKakao(auth: UserAuth) {
        
    }
    
    public func revokeAppleToken(
        clientSecret: String,
        token: String,
        completionHandler: @escaping () -> Void
    ) async {
        
    }
    
    public func unlinkKakao(completionHandler: @escaping () -> Void) async {
        
    }
}
