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
        var otherSettingList: [OtherSettingComponentModel] = []
        
        public init() {
            self.appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            self.otherSettingList = [
                OtherSettingComponentModel(isDevider: true, imageName: "termsOfService", content: "개인정보 처리방침", detail: "개인정보 처리방침 이용약관 입니다." ,notShowLeft: false),
                OtherSettingComponentModel(isDevider: true, imageName: "privacyPolicy", content: "서비스 이용약관", detail: "서비스 이용약관입니다." ,notShowLeft: false),
                OtherSettingComponentModel(isDevider: true, imageName: "marketingTerm", content: "마케팅 이용약관", detail: "마케팅 서비스 이용약관입니다." ,notShowLeft: false),
                OtherSettingComponentModel(isDevider: true, imageName: "withDraw", content: "회원 탈퇴", detail: "회원 탈퇴할때 사용하는 서비스에요." ,notShowLeft: false),
                OtherSettingComponentModel(isDevider: false, imageName: "appVersion", content: "앱 버전", detail: "앱버전 관리 서비스에요." , notShowLeft: true)
            ]
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

