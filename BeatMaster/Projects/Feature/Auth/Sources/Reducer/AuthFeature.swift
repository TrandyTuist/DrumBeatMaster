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

@Reducer
public struct AuthFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var authMainImage: ImageAsset = .logoIcon
        var authMainViewTitle: String = "BeatMaster"
        @Presents var loginFeature: LoginFeature.State?
        public init() {}
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
                return .none
            case .presntLoginBottomSheet:
                state.loginFeature = LoginFeature.State()
                return .none
            }
        }
        .ifLet(\.$loginFeature, action: \.presentBottomSheet) {
            LoginFeature()
        }
        
    }
}
