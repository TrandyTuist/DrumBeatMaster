//
//  WithDrawFeature.swift
//  Profile
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

import Model
import UseCase

import ComposableArchitecture
import KeychainAccess


@Reducer
public struct WithDrawFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var auth:  UserAuth?
        var isSelectDropDownMenu: Bool = false
        var selectWithDrawReason: String = "이런 점이 불편했어요."
        var withDrawtitle: String = "어떤 점이 불편하셨는지"
        var withDrawSubtitle: String = "말씀해 주실 수 있을까요?"
        var isPresntAlert: Bool = false
        var alertTitle: String = "정말로 탈퇴 하시겠습니까?"
        var alertSubTitle: String =  "탈퇴하시면 BeatMaster을 이용하실수 없어요!"
        
        public init(
            auth: UserAuth?  = nil
        ) {
            self.auth = auth
        }
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case withDraw(
            socialType: SocialType,
            completion: () -> Void)
        case revokeAppleToken(
            clientSecret: String,
            token: String,
            completion: () -> Void)
        
        case showAlert
        case confirmAction(
            socialType: SocialType,
            completion: () -> Void)
        case cancelAction
        
        case unlinkKakao(completion: () -> Void)
        
        case deleteAuth
    }
    
    @Dependency(AuthUseCase.self) var authUseCase
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(_):
                return .none
            case let.withDraw(socialType: socialType, completion: completion):
                return .run  { send in
                    switch socialType {
                    case .apple:
                        guard let clientSecret = try? Keychain().get("AppleClientSecret"),
                        let refreshToken = try? Keychain().get("AuthCode")
                        else { return  }
                        await send(.revokeAppleToken(clientSecret: clientSecret , token: refreshToken, completion: completion))
                        await send(.deleteAuth)
                    case .kakao:
                        await send(.unlinkKakao(completion: completion))
                        await send(.deleteAuth)
                    case .unknown:
                        break
                    }
                    
                }
                
            case let .revokeAppleToken(clientSecret: clientSecret, token: token, completion: completion):
                UserDefaults.standard.set(false, forKey: "isDelete")
                return .run { send in
                    try? await authUseCase.revokeAppleToken(
                        clientSecret: clientSecret,
                        token: token,
                        completionHandler:  completion
                    )
                }
                
            case let .unlinkKakao(completion: completion):
                return .run { send in
                    try? await authUseCase.unlinkKakao(completionHandler: completion)
                }
                
            case .deleteAuth:
                try? Keychain().removeAll()
                return .none
                
            case .showAlert:
                state.isPresntAlert.toggle()
                return .none
                
            case let .confirmAction(socialType: socialType, completion: completion):
                return .run { send in
                    await send(.withDraw(socialType: socialType, completion: completion))
                }
                
            case .cancelAction:
                state.isPresntAlert = false
                return .none
            }
        }
    }
}

