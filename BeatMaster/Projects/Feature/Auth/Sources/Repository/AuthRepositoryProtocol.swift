//
//  AuthRepositoryProtocol.swift
//  Auth
//
//  Created by 서원지 on 3/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import AuthenticationServices
import Model

public protocol AuthRepositoryProtocol {
    func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping (String) -> Void
    ) async throws -> Auth
}

final class DefaultAuthRepository : AuthRepositoryProtocol {
    func handleAppleLoginResult(result: Result<ASAuthorization, Error>, completion: @escaping (String) -> Void) async throws -> Model.Auth {
        return Auth(isLogin: nil, token: "", socialType: nil, name: "", email: "")
    }
    
    
}
