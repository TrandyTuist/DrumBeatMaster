//
//  ProfileFeature.swift
//  Profile
//
//  Created by 서원지 on 3/26/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//


import Foundation

import Model
import DesignSystem

import ComposableArchitecture
import KeychainAccess
import UIKit


@Reducer
public struct ProfileFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var title: String = "프로필"
        var auth: UserAuth?
        var profileViewList: [ProfileComponentModel] = []
        
        
        public init(
            auth: UserAuth? = nil
        ) {
            self.auth = auth
            self.profileViewList = [
                ProfileComponentModel(isDevider: true, imageName: "review", content: "앱 리뷰 작성", detail: "서비스에 대한 평가를 남겨주세요."),
                ProfileComponentModel(isDevider: true, imageName: "bug", content: "버그 신고 및 의견 공유", detail: "더 좋은 서비스를 함께 만들어가요."),
                ProfileComponentModel(isDevider: false, imageName: "setting", content: "기타 설정", detail: "각종 설정들을 관리해요.")
            ]
        }
        
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case backAction
        case logout
        case appear
        
        case tapReview
        case presentSetting
        case tapBug
    }
    
    @Dependency(\.dismiss) var dismiss
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .backAction:
                return .run { send in
                    await dismiss()
                }
                
            case .logout:
                state.auth?.isLogin = false
                try? Keychain().set(state.auth?.isLogin?.description ?? "", key: "isLogin")
                return .none
                
            case .appear:
                state.auth = state.auth
                return .none
                
            case .binding:
                return .none
                
            case .tapReview:
                return .run { send in
                    if let appstoreUrl = URL(string: "https://apps.apple.com/app/id6472920141") {
                        var urlComp = URLComponents(url: appstoreUrl, resolvingAgainstBaseURL: false)
                        urlComp?.queryItems = [
                            URLQueryItem(name: "action", value: "write-review")
                        ]
                        guard let reviewUrl = urlComp?.url else {
                            return
                        }
                        await UIApplication.shared.open(reviewUrl, options: [:], completionHandler: nil)
                    }
                }
                
            case .tapBug:
                return .run { send in
                    guard let subject = "문의/제휴".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                          let body = """
                        아래 내용을 적어주세요. 빠르게 답변 드리겠습니다.\n
                        • 이용 중인 기기/OS 버전:\n
                        • 닉네임: \n
                        • 문의 내용:
                        """.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                          let url = URL(string: "mailto:suhwj81@gmail.com?subject=\(subject)&body=\(body)") else {
                        return
                    }
                    
                    if await UIApplication.shared.canOpenURL(url) {
                        await UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
                
            case .presentSetting:
                return .none
            }
        }
        .onChange(of: \.auth) { oldValue, newValue in
            Reduce { state, action in
                state.auth = newValue
                return .none
            }
        }
    }
}

