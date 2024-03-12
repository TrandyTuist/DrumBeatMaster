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
        var auth: IdentifiedArrayOf<Auth> = []
       
        
        public init(
//            auth: Auth
        ) {
//            self.auth = auth
        }
        
    }
    
    public enum Action: Equatable {
        case appearLogin
        case presentLogin
        case presentSignUp
        case presentBottomSheet(PresentationAction<LoginFeature.Action>)
        case presntLoginBottomSheet
        case addLoginBottomSheet
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .presentLogin:
                return .none
                
            case .presentSignUp:
                return .none
            
            case .appearLogin:
//                var auths = state.loginFeature
//                auths?.auth =  state.auth.first ?? .init(isLogin: false, token: "", name: "", email: "")
//                print("\(state.auth.first?.isLogin)")
//                state.loginFeature = LoginFeature.State(auth: .init(isLogin: auths?.auth.isLogin ?? false, token: "", name: "", email: ""))
                return .none
                
            case .presentBottomSheet:
                return .none
                
            case .presntLoginBottomSheet:
                state.loginFeature = LoginFeature.State(auth: Auth(isLogin: false, token: "", name: "", email: ""))
                return .none
                
            case .addLoginBottomSheet:
                guard let auth = state.loginFeature?.auth
                else { return .none}
                state.auth.append(auth)
                state.loginFeature = nil
                return .run { send in
                    if auth.isLogin == true {
                        print("로그인 성공")
                    }
                }
            }
        }
        .ifLet(\.$loginFeature, action: \.presentBottomSheet) {
            LoginFeature()
        }
    }
}
