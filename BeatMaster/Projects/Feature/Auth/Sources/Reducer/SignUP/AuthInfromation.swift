//
//  AuthInfromationFeature.swift
//  Auth
//
//  Created by 서원지 on 3/17/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//


import Foundation

import Model

import ComposableArchitecture

@Reducer
public struct AuthInfromationFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var title: String = "회원가입 정보입력"
        var auth: UserAuth?
        public init(auth: UserAuth? = nil) {
            self.auth = auth
        }
       
    }
    
    @Dependency(\.dismiss) var dismiss
    
    public enum Action {
        case backAction
        case appear
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backAction:
                return .run { send in
                     await dismiss()
                }
                
            case .appear:
                state.auth = state.auth
                return .none
                        
            }
        }
    }
}

