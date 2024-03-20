//
//  LoginFeature.swift
//  Auth
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import DesignSystem
import Model

import AuthenticationServices

@Reducer
public struct LoginFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var loginMainImage: ImageAsset = .logoIcon
        var loginMainViewTitle: String = "BeatMaster"
        var auth: Auth?
        var isLogin: Bool = false
        var nonce: String = ""
        public init(auth: Auth? = nil) {
            self.auth = auth
        }
    }
    
    public enum Action: BindableAction {
        case backAction
        case isLogin(socialType: SocialType)
        case disappear
        case binding(BindingAction<State>)
        case appleLogin(result: Result<ASAuthorization, Error>,completion: (String) -> Void)
        
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(AuthUseCase.self) var authUseCase
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .backAction:
                return .run { _ in 
                    await self.dismiss()
                    
                }
                
            case let .isLogin(socialType: socialType):
                switch socialType {
                case .apple:
                    state.auth = state.auth
                    state.auth?.socialType = .apple
                    state.auth?.isLogin?.toggle()
                case .kakao:
                    state.auth = state.auth
                    state.auth?.socialType = .kakao
                    state.auth?.isLogin?.toggle()
                    
                }
                return .none
                
            case let .appleLogin(result: result, completion: completion):
                return .run { send in
                     authUseCase.handleAppleLoginResult(result: result, completion: completion)
                }
                
            case .disappear:
                state.auth = state.auth
                return .none
                
            case .binding(_):
                return .none
            
                
            }
        }
        
    }
}

