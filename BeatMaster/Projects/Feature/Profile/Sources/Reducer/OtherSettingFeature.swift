//
//  OtherSettingFeature.swift
//  Profile
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Model

@Reducer
public struct OtherSettingFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var appVersion: String = ""
        
        public init() {
            self.appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        }
        
        
    }
    
    public enum Action: Equatable {
        case presentPrivacyPolicyWeb
        case presentTermsOfServiceWeb
        case presentMarketingTerm
        case presentWthDraw
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .presentPrivacyPolicyWeb:
                return .none
            case .presentTermsOfServiceWeb:
                return .none
            case .presentMarketingTerm:
                return .none
            case .presentWthDraw:
                return .none
            }
        }
    }
}

