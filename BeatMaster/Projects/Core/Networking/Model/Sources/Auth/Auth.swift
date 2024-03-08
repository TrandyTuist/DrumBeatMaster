//
//  Auth.swift
//  Model
//
//  Created by 서원지 on 3/8/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

public struct AuthModel: Equatable {
    public var data: Auth
    
    public init(data: Auth) {
        self.data = data
    }
}

public struct Auth : Equatable, Identifiable, Codable{
    public var id: UUID = UUID()
    public var isLogin: Bool
    public var token: String
    public var name: String
    public  var email: String
    
    public init(
        isLogin: Bool,
        token: String,
        name: String,
        email: String) {
        self.isLogin = isLogin
        self.token = token
        self.name = name
        self.email = email
    }
    
}
