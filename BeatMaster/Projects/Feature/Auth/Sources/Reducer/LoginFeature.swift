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

@Reducer
public struct LoginFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var loginMainImage: ImageAsset = .logoIcon
        var loginMainViewTitle: String = "BeatMaster"
        var auth: Auth?
        
        public init(auth: Auth? = nil) {
            self.auth = auth
        }
    }
    
    public enum Action: Equatable {
        case backAction
        case isLogin
        case disappear
        
    }
    
    @Dependency(\.dismiss) var dismiss
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backAction:
                return .run { _ in 
                    await self.dismiss()
                    
                }
                
            case .isLogin:
                state.auth = state.auth
                state.auth?.isLogin.toggle()
                print("눌림, \(state.auth)")
                return .none
                
            case .disappear:
                state.auth = state.auth
                return .none
            }
        }
        
    }
}

