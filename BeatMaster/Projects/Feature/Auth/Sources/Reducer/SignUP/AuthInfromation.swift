//
//  AuthInfromationFeature.swift
//  Auth
//
//  Created by 서원지 on 3/17/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//


import Foundation

import Model
import Profile
import UseCase

import ComposableArchitecture
import KeychainAccess

@Reducer
public struct AuthInfromationFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var title: String = "회원가입 정보입력"
        var auth: UserAuth?
        var selectJob: SelectJob? = nil
        var disableSignUpButtonb: Bool = false
         
        @Presents var destination: Destination.State?
        
        public init(auth: UserAuth? = nil) {
            self.auth = auth
        }
        
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(AuthUseCase.self) var authUseCase
    
    public enum Action {
        case backAction
        case appear
        case selectJobButton(selectJob: SelectJob?)
        case destination(PresentationAction<Destination.Action>)
        case presntProfile
    }
    
    @Reducer(state: .equatable)
    public enum Destination {
        case profile(ProfileFeature)
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
                
            case .destination:
                return .none
                
            case let .selectJobButton(selectJob: selectJob):
                if state.selectJob == selectJob {
                    state.selectJob = nil
                } else {
                    state.selectJob = selectJob
                }
                state.disableSignUpButtonb = state.selectJob != nil
                return .none
                
            case .presntProfile:
                //MARK: - api 호출후 로직 처리
                state.auth?.isLogin = true
                state.destination = .profile(ProfileFeature.State(auth: nil))
                try? Keychain().set(state.auth?.isLogin?.description ?? "", key: "isLogin")
                UserDefaults.standard.set("false", forKey: "isDelete")
                return .none
            }
        }
        
        .ifLet(\.$destination, action: \.destination)
        
        .onChange(of: \.auth) { oldValue, newValue in
            Reduce { state, action in
                state.auth = newValue
                return .none
            }
        }
    }
}
