//
//  SignUpFeature.swift
//  Auth
//
//  Created by 서원지 on 3/2/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Model

@Reducer
public struct SignUpFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
       
        
        var title: String = "SignUp"
        var policyTitle: String = "서비스 이용약관"
        
        var webLoading: Bool = false
        var isAllAgreed: Bool = false
        var isTermsofServiceAgreed: Bool = false
        var isServicePolicyAgreed: Bool = false
        var isMarketingInformationAgreed: Bool = false
        var isPrivacyPolicyAgreed: Bool = false
        var isConfirmButtonActivated: Bool = false
        
        @Presents var selectSocial: SelectSocialFeature.State?
        
        var auth: Auth?
        
        public init(auth: Auth? = nil) {
            self.auth = auth
        }
        
    }
    
    public enum Action: Equatable, BindableAction {
        case presentSignUp
        case presentWebTermsofServiceAgreed
        case presentMarketingInformationAgreed
        case presentPolicyAgreedWeb
        case presentAuthInformation
        
        case binding(BindingAction<State>)
        case didTapAgreeAllPolicy
        case didTapAgreeServicePolicy
        case didTapAgreePrivacyPolicy
        case didTapAgreeMarketingInformation
        
        case selectSocial(PresentationAction<SelectSocialFeature.Action>)
        case selectSocialBottomSheet
        
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
                
            case .presentAuthInformation:
                state.selectSocial = nil
                guard let auth = state.selectSocial?.auth
                else { return .none }
                state.auth = auth
                state.selectSocial = SelectSocialFeature.State(auth: auth)
                print(auth)
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
                
                
            case .selectSocial:
                return .none
                
            case .selectSocialBottomSheet:
                state.selectSocial = SelectSocialFeature.State(auth: state.selectSocial?.auth)
                return .none
            }
        }
        .ifLet(\.$selectSocial, action: \.selectSocial){
            SelectSocialFeature()
        }
    }
}

