//
//  SelectSocialFeature.swift
//  Auth
//
//  Created by 서원지 on 3/16/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Model
import ComposableArchitecture


@Reducer
public struct SelectSocialFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var auth: Auth?
        
        public init(auth: Auth? = nil) {
            self.auth = auth
        }
        
    }
    
    public enum Action: Equatable {
        case selectLogin(socialType: SocialType)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectLogin(socialType: socialType):
                switch socialType {
                case .apple:
                    state.auth?.socialType = .apple
                    print("Apple 회원가입, \(state.auth)")
                case .kakao:
                    state.auth?.socialType = .kakao
                    print("Apple 회원가입, \(state.auth)")
                }
                return .none
                
            }
        }
    }
}

