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

public final class AuthUseCase: AuthUseCaseProtocol , ObservableObject {
    
    
    private let repository: AuthRepositoryProtocol
    
    public init(
        repository: AuthRepositoryProtocol
    ) {
        self.repository = repository
    }
    var authModel: Auth?
    
    //MARK: -  애플 로그인
    public func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping (String) -> Void
    ) async throws -> Model.Auth {
        return try await repository.handleAppleLoginResult(result: result, completion: completion)
//        switch result {
//        case .success(let authResults):
//            switch authResults.credential {
//            case let appleIDCredential as ASAuthorizationAppleIDCredential:
//                if let tokenData = appleIDCredential.identityToken,
//                   let identityToken = String(data: tokenData, encoding: .utf8) {
//                    
//                }
//                let lastName = appleIDCredential.fullName?.familyName ?? ""
//                let firstName = appleIDCredential.fullName?.givenName ?? ""
//                let name = "\(lastName)\(firstName)"
//                let email = appleIDCredential.email ?? ""
//                
//                authModel?.email = email
//                
//                print("이메일 \(authModel?.email)")
//                
//                
//            default:
//                break
//            }
//        case .failure(let error):
//            print(error.localizedDescription)
//            print("error")
//        }
//        return authModel ?? .init(token: "", socialType: .apple, name: "", email: "")
    }
    
}

extension AuthUseCase: DependencyKey {
    public static let liveValue: AuthUseCase = {
        let authRepository = DIContainer.container.resolve(AuthRepositoryProtocol.self) ?? DefaultAuthRepository()
        return AuthUseCase(repository: authRepository)
    }()
}

extension DependencyValues {
    public var authUseCase: AuthUseCaseProtocol {
        get { self[AuthUseCase.self] }
        set { self[AuthUseCase.self] = newValue as! AuthUseCase }
    }
}

//public extension DependencyValues {
//    var authUseCase: AuthUseCaseProtocol {
//        get { self[AuthUseCase.self] }
//        set { self[AuthUseCase.self] = newValue as! AuthUseCase }
//    }
//}
//extension NotificationUseCase: DependencyKey {
//    
//    public static let liveValue: NotificationUseCase = Self(repository: DIContainer.container.resolve(NotificationRepositoriesProtocol.self)!)
//}
//
//extension DependencyValues {
//    public var notificationUseCase: NotificationUseCaseProtocol {
//        get { self[NotificationUseCase.self] }
//        set { self[NotificationUseCase.self] = newValue as! NotificationUseCase }
//    }
//}
//
//
