//
//  AuthRepository.swift
//  UseCase
//
//  Created by 서원지 on 4/22/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import AuthenticationServices
import SwiftUI
import Combine

import Model
import Service

import Moya
import CombineMoya
import Alamofire
import SwiftJWT
import KeychainAccess
import KakaoSDKAuth
import KakaoSDKUser

@Observable public class AuthRepository: AuthRepositoryProtocol {
    
    var authModel: UserAuth?
    var appleAuthModel: AppleTokenResponse?
    let provider = MoyaProvider<AppleAuthService>(plugins: [MoyaLoggingPlugin()])
    var appleAuthCancellable: AnyCancellable?
    var revokeAppleTokenCancellable: AnyCancellable?
    
    public init() {
        
    }
    
    //MARK: -  모델  값 넘기기
    public func authModelToReducer(auth: UserAuth) {
        self.authModel = auth
    }
    
    //MARK: - 애플 로그인
    public func handleAppleLoginResult(
        result: Result<ASAuthorization, Error>,
        completion: @escaping () -> Void
    ) async {
        switch result {
        case .success(let authResults):
            switch authResults.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                guard let tokenData = appleIDCredential.identityToken,
                      let identityToken = String(data: tokenData, encoding: .utf8) else {
                    Log.error("Identity token is missing")
                    return
                }
                let lastName = appleIDCredential.fullName?.familyName ?? ""
                let firstName = appleIDCredential.fullName?.givenName ?? ""
                let name = "\(lastName)\(firstName)"
                let email = appleIDCredential.email ?? ""
                
                if let authorizationCode = appleIDCredential.authorizationCode {
                    let code = String(decoding: authorizationCode, as: UTF8.self)
                    Log.debug("Code - \(code), \(email), \(name)")
                    self.getAppleRefreshToken(code: code) { [weak self] data in
                        Log.debug("🚧", data ?? "-")
                        try? Keychain().set(data ?? "", key: "Token")
                        // UserDefaults.standard.set(data, forKey: "AppleRefreshToken")
                        guard let acessToken = data
                        else { return }
                        let token = (try? Keychain().get("Token")) ?? ""
                        self?.authModel?.token = token
                        if !acessToken.isEmpty || acessToken != "" {
                            completion()
                        }
                        
                        if name == "" || email == "" {
                            let appleIDName = try? Keychain().get("NAME")
                            let appleIDEmail = try? Keychain().get("EMAIL")
                            
                            self?.authModel?.email = appleIDEmail ?? ""
                            self?.authModel?.name = appleIDName ?? ""
                        } else {
                            try? Keychain().set(appleIDCredential.email ?? "", key: "EMAIL")
                            try? Keychain().set(name, key: "NAME")
                        }
                    }
                } else {
                    Log.error("🚧 authorizationCode is nil")
                }
                
                Log.debug("email: \(email)", (try? Keychain().get("EMAIL")) ?? "",
                          (try? Keychain().get("NAME")) ?? "", self.authModel?.token ?? "")
            default:
                break
            }
        case .failure(let error):
            Log.error("에러", error.localizedDescription, Self.self ,#function)
        }
    }
    
    //MARK: -   카카오 로그인 후 토큰 발급
    public func requestKakaoTokenAsync(
        completion: @escaping () -> Void
    ) async {
         UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            guard let accessToken = oauthToken?.accessToken else {
                Log.error(error?.localizedDescription ?? "", "requestKakaoTokenAsync")
//                    continuation.resume(returning: (nil, nil))
                return
            }
             try? Keychain().set(accessToken, key: "Token")
             Log.debug(accessToken, self.authModel?.token ?? "")
             let token = (try? Keychain().get("Token")) ?? ""
             
             self.authModel?.token = accessToken
             
             if !accessToken.isEmpty || accessToken != "" {
                 Log.debug("acces path2: \(accessToken)")
                 completion()
                 
                 guard let auth = self.authModel
                 else {return}
                 self.getUserInfoKakao(auth: auth)
             }
        }
        
    }
    
    public func getUserInfoKakao(auth: UserAuth) {
        UserApi.shared.me { user, error in
            if let error = error {
                Log.error("프로필 가져오기 실패", error.localizedDescription)
            } else {
                
                let kakaoAccountEmail = user?.kakaoAccount?.email ?? ""
                let kakaoAccountName = user?.kakaoAccount?.profile?.nickname ?? ""
                try? Keychain().set(kakaoAccountEmail, key: "EMAIL")
                try? Keychain().set(kakaoAccountName , key: "NAME")
                let email = (try? Keychain().get("EMAIL")) ?? ""
                let name = (try? Keychain().get("NAME")) ?? ""
                
                self.authModel?.email = email
                self.authModel?.name = name
                Log.debug("프로필 가져오기",  self.authModel?.email,  self.authModel?.name ?? "" )
                
            }
        }
    }
    
    
    private func appleAuthToUseCase(_ list: AppleTokenResponse) {
        self.appleAuthModel = list
    }
    
    //MARK: - jwt 만들기
    func makeJWT() -> String {
        let myHeader = Header(kid: "P552TDR3Q2")
        
        // MARK: - client_secret(JWT) 발급 응답 모델
        struct MyClaims: Claims {
            let iss: String
            let iat: Int
            let exp: Int
            let aud: String
            let sub: String
        }
        
        var dateComponent = DateComponents()
        dateComponent.month = 6
        let iat = Int(Date().timeIntervalSince1970)
        let exp = iat + 3600
        let myClaims = MyClaims(iss: "N94CS4N6VR",
                                iat: iat,
                                exp: exp,
                                aud: "https://appleid.apple.com",
                                sub: "com.Haejoo.BeatMaster")
        
        var myJWT = JWT(header: myHeader, claims: myClaims)
        guard let url = Bundle.main.url(forResource: "AuthKey_P552TDR3Q2", withExtension: "p8"),
              let privateKey: Data = try? Data(contentsOf: url, options: .alwaysMapped),
              let signedJWT = try? myJWT.sign(using: JWTSigner.es256(privateKey: privateKey))
        else {
            return ""
        }
        try? Keychain().set(signedJWT, key: "AppleClientSecret")
        Log.debug("🗝 singedJWT -", signedJWT)
        return signedJWT
    }
    
    //MARK: - 애플 리프레쉬 토근  발급
    public func getAppleRefreshToken(
        code: String,
        completionHandler: @escaping (String?) -> Void
    )  {
        if let cancellable = appleAuthCancellable {
            cancellable.cancel()
        }
        
        let secret = makeJWT()
        appleAuthCancellable = provider.requestWithProgressPublisher(.getRefreshToken(code: code, clientSecret: secret))
            .compactMap{$0.response?.data}
            .receive(on: DispatchQueue.main)
            .decode(type: AppleTokenResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    Log.error("애플 토큰 발급 실패 -", error.localizedDescription)
                }
            }, receiveValue: { [weak self] model in
                self?.appleAuthToUseCase(model)
                Log.network("애플 토큰 발급 성공 ", model)
                if model.refresh_token == nil {
                    Log.error("if model.refresh_token == nil")
                } else {
                    completionHandler(model.refresh_token)
                }
            })
    }
    
    //MARK: - appleToken 삭제
    public func revokeAppleToken(
        clientSecret: String,
        token: String,
        completionHandler: @escaping () -> Void
    ) async {
        if let cancellable = revokeAppleTokenCancellable {
            cancellable.cancel()
        }
        
        revokeAppleTokenCancellable = provider.requestWithProgressPublisher(.revokeToken(clientSecret: clientSecret, token: token))
            .compactMap{$0.response?.data}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    completionHandler()
                case .failure(let error):
                    Log.error("네트워크 에러 ", error.localizedDescription)
                }
            }, receiveValue: { [weak self] model in
                Log.network("애플토큰 삭제", model)
                completionHandler()
            })
    }
    
    public func unlinkKakao(completionHandler: @escaping () -> Void) async {
        UserApi.shared.unlink {(error) in
            if let error = error {
                Log.debug("토크 에러", error.localizedDescription)
            }
            else {
                completionHandler()
                Log.debug("카카오 토큰 삭제")
            }
        }
    }
}
