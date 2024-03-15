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
        
        var webLoading: Bool = false
        var isAllAgreed: Bool = false
        var isTermsofServiceAgreed: Bool = false
        var isServicePolicyAgreed: Bool = false
        var isMarketingInformationAgreed: Bool = false
        var isPrivacyPolicyAgreed: Bool = false
        var isConfirmButtonActivated: Bool = false
        
    }
    
    public enum Action: Equatable, BindableAction {
        case presentSignUp
        case presentWebTermsofServiceAgreed
        case presentMarketingInformationAgreed
        case presentPolicyAgreedWeb
        case binding(BindingAction<State>)
        case didTapAgreeAllPolicy
        case didTapAgreeServicePolicy
        case didTapAgreePrivacyPolicy
        case didTapAgreeMarketingInformation
        
        
        
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .presentSignUp:
                return .none
               
            case .presentWebTermsofServiceAgreed:
                return .none
                
            case .presentMarketingInformationAgreed:
                return .none
                
            case .presentPolicyAgreedWeb:
                return .none
                
            case .binding(_):
              return .none
                
            case .didTapAgreeAllPolicy:
                state.isAllAgreed.toggle()
                state.isTermsofServiceAgreed = state.isAllAgreed
                state.isServicePolicyAgreed = state.isAllAgreed
                state.isMarketingInformationAgreed = state.isAllAgreed
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            case .didTapAgreePrivacyPolicy:
                state.isTermsofServiceAgreed.toggle()
                state.isAllAgreed = state.isTermsofServiceAgreed && state.isServicePolicyAgreed
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            case .didTapAgreeServicePolicy:
                state.isServicePolicyAgreed.toggle()
                state.isAllAgreed = state.isTermsofServiceAgreed && state.isServicePolicyAgreed
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            case .didTapAgreeMarketingInformation:
                state.isMarketingInformationAgreed.toggle()
                state.isAllAgreed = state.isTermsofServiceAgreed && state.isServicePolicyAgreed 
                state.isConfirmButtonActivated = state.isAllAgreed
                return .none
                
            }
        }
    }
}

