//
//  ProfileFeature.swift
//  Profile
//
//  Created by 서원지 on 3/26/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//


import Foundation

import Model
import DesignSystem

import ComposableArchitecture
import KeychainAccess

@Reducer
public struct ProfileFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var title: String = "프로필"
        var auth: UserAuth?
        
        public init(
            auth: UserAuth? = nil
        ) {
            self.auth = auth
        }
        
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case backAction
        case logout
        case appear
    }
    
    @Dependency(\.dismiss) var dismiss
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .backAction:
                return .run { send in
                    await dismiss()
                }
                
            case .logout:
                state.auth?.isLogin = false
                try? Keychain().set(state.auth?.isLogin?.description ?? "", key: "isLogin")
                return .none
                
            case .appear:
                state.auth = state.auth
                return .none
                
            case .binding:
                return .none
            }
        }
    }
}

