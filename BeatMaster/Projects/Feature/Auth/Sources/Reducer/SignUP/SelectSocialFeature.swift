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
        
        @Presents var authInformation: AuthInfromationFeature.State?
    }
    
    public enum Action: Equatable {
        case selectLogin(socialType: SocialType)
        case authInformation(PresentationAction<AuthInfromationFeature.Action>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .selectLogin(socialType: socialType):
                guard let auth = state.authInformation?.auth
                else  { return .none }
                state.auth = auth
                
                switch socialType {
                case .apple:
                    state.auth = state.auth
                    state.auth?.socialType = .apple
                    guard let auth = state.authInformation?.auth
                    else  { return .none }
                    state.auth = auth
                    state.authInformation = AuthInfromationFeature.State(auth: state.auth)
                    print("Apple 회원가입, \(state.auth)")
                case .kakao:
                    
                    print("Kakao 회원가입")
                    state.auth = state.auth
                    state.auth?.socialType = .kakao
                    guard let auth = state.authInformation?.auth
                    else  { return .none }
                    state.auth = auth
                    state.authInformation = AuthInfromationFeature.State(auth: state.auth)
                    print("Apple 회원가입, \(state.auth)")
                }
                return .none
                
            case .authInformation:
                return .none
            }
        }
        .ifLet(\.$authInformation, action: \.authInformation){
            AuthInfromationFeature()
        }
    }
}

