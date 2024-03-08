//
//  AuthFeature.swift
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
public struct AuthFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var authMainImage: ImageAsset = .logoIcon
        var authMainViewTitle: String = "BeatMaster"
        @Presents var loginFeature: LoginFeature.State?
        var auth: Auth
        
        public init(
            auth: Auth
        ) {
            self.auth = auth
        }
        
    }
    
    public enum Action: Equatable {
        case presentLogin
        case presentSignUp
        case presentBottomSheet(PresentationAction<LoginFeature.Action>)
        case presntLoginBottomSheet
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .presentLogin:
                return .none
                
            case .presentSignUp:
                return .none
                
            case .presentBottomSheet:
                state.auth = state.auth
                state.loginFeature = LoginFeature.State(auth: state.auth)
                return .none
                
            case .presntLoginBottomSheet:
                state.auth = state.auth
                state.loginFeature = LoginFeature.State(auth: state.auth)
                return .none
            }
        }
        .ifLet(\.$loginFeature, action: \.presentBottomSheet) {
            LoginFeature()
        }
        
    }
}
