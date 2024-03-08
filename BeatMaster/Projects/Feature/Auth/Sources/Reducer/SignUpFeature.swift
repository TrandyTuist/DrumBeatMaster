//
//  SignUpFeature.swift
//  Auth
//
//  Created by 서원지 on 3/2/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct SignUpFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        
        var title: String = "SignUp"
        var policyTitle: String = "서비스 이용약관"
        
        var isAllAgreed: Bool = false
        var isServicePolicyAgreed: Bool = false
        var isPrivacyPolicyAgreed: Bool = false
        var isConfirmButtonActivated: Bool = false
        
    }
    
    public enum Action: Equatable, BindableAction {
        case presentSignUp
        case binding(BindingAction<State>)
        case didTapAgreeAllPolicy
        case didTapAgreeServicePolicy
        case didTapAgreePrivacyPolicy
        
        case didTapServicePolicyDetail
        case didTapPrivacyPolicyDetail
        
    }
    
    public var body: some ReducerOf<Self> {
//        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .presentSignUp:
                return .none
                
            case .binding(_):
              return .none
                
            case .didTapAgreeAllPolicy:
                state.isAllAgreed.toggle()
                
                state.isServicePolicyAgreed = state.isAllAgreed
                state.isPrivacyPolicyAgreed = state.isAllAgreed
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            case .didTapAgreePrivacyPolicy:
                state.isPrivacyPolicyAgreed.toggle()
                state.isAllAgreed = state.isPrivacyPolicyAgreed && state.isServicePolicyAgreed
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            case .didTapAgreeServicePolicy:
                state.isServicePolicyAgreed.toggle()
                state.isAllAgreed = state.isPrivacyPolicyAgreed && state.isServicePolicyAgreed
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            case .didTapServicePolicyDetail:
                return .none
                
            case .didTapPrivacyPolicyDetail:
                return .none
            }
        }
    }
}

