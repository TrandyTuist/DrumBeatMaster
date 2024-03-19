//
//  AuthRepository.swift
//  Auth
//
//  Created by 서원지 on 3/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import AuthenticationServices
import Model

 public class AuthRepository: AuthRepositoryProtocol, ObservableObject {
    
    public init() {
        
    }
    
    var authModel: Auth?
    
    
    public func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping (String) -> Void
    ) {
        switch result {
                case .success(let authResults):
                    switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        guard let tokenData = appleIDCredential.identityToken,
                           let identityToken = String(data: tokenData, encoding: .utf8)  else {
                                return
                            }
                        let lastName = appleIDCredential.fullName?.familyName ?? ""
                        let firstName = appleIDCredential.fullName?.givenName ?? ""
                        let name = "\(lastName)\(firstName)"
                        let email = appleIDCredential.email ?? ""
        
                        authModel?.email = email
        
                        print("이메일 \(authModel?.email), \(email)")
                        
                        if let authorizationCode = appleIDCredential.authorizationCode {
                            let code = String(decoding: authorizationCode, as: UTF8.self)
                            print("Code - \(code)")
//                            self.getAppleRefreshToken(code: code) { data in
//                                print("🚧 \(data ?? "-")")
//                                UserDefaults.standard.set(data, forKey: "AppleRefreshToken")
//                            }
                        } else {
                            print("🚧 authorizationCode is nil")
                        }
                        completion(identityToken)

        
                        
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
    }
    
    
}
