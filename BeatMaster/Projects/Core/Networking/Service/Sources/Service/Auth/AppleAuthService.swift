//
//  AppleAuthService.swift
//  Service
//
//  Created by 서원지 on 3/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import API
import Moya

public enum AppleAuthService {
    case getRefreshToken(code: String, clientSecret: String)
    case revokeToken(clientSecret: String, token: String)
}

extension AppleAuthService: AppleLoginTarget {
    public var path: String {
        switch self {
        case .getRefreshToken:
            return BeatMaserAuthAPI.appleLoginURL
            
        case .revokeToken:
            return BeatMaserAuthAPI.revokeAppleLoginURL
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getRefreshToken:
            return .post
            
        case .revokeToken:
            return .post
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .getRefreshToken(let code, let clientSecret):
            let parameters: [String: Any] = [
                "client_id": "com.Haejoo.BeatMaster",
                "client_secret": clientSecret,
                "code": code,
                "grant_type": "authorization_code"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            
            
        case .revokeToken(let clientSecret, let token):
            let parameters: [String: Any] = [
                "client_id": "com.Haejoo.BeatMaster",
                "client_secret": clientSecret,
                "token": token,
                "token_type_hint": "refresh_token"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.httpBody)
        }
    }
}
