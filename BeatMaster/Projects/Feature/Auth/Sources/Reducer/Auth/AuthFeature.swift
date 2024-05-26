//
//  AuthFeature.swift
//  Auth
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Service
import ComposableArchitecture
import DesignSystem
import Model
import KeychainAccess
import Profile



@Reducer
public struct AuthFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        
        var authMainImage: ImageAsset = .logoIcon
        var authMainViewTitle: String = "BeatMaster"
        
        var auth: IdentifiedArrayOf<UserAuth> = []
         var authModel: UserAuth?
        var webLoading: Bool = false
        
        //        @Presents var loginFeature: LoginFeature.State?
        //        @Presents var profileFeature: ProfileFeature.State? = .init()
        @Presents var destination: Destination.State?
        
        public init(
            authModel: UserAuth? = nil
        ) {
            self.authModel = authModel
        }
    }
    
    @Reducer(state: .equatable)
    public enum Destination {
        case login(LoginFeature)
        case profile(ProfileFeature)
    }
    
    @Dependency(\.dismiss) var dismiss
    @Dependency(\.continuousClock) var clock
    
    public enum Action:  BindableAction {
        //        case path(StackAction<Path.State, Path.Action>)
        case binding(BindingAction<State>)
        //        case presentBottomSheet(PresentationAction<LoginFeature.Action>)
        //        case presentProfile(PresentationAction<ProfileFeature.Action>)
        
        case destination(PresentationAction<Destination.Action>)
        
        case appearLogin
        case presentLogin
        case presentSignUp
        case presntProfileAuthInfo
        
        case presntLoginBottomSheet
        case presntProfileData
        case addLoginBottomSheet
        case backAction
    }
    
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .presentLogin:
                return .none
                
            case .presentSignUp:
                return .none
                  
            case .presntProfileAuthInfo:
                return .none
                
            case .destination:
                return .none
                
            case .appearLogin:
                let email: String = (try? Keychain().get("EMAIL")) ?? ""
                let nickname: String = (try? Keychain().get("NAME")) ?? ""
                let socialTypeDesc: String = ( try? Keychain().get("SocialType")) ?? ""
                let socialType: SocialType = SocialType(rawValue: socialTypeDesc) ?? .apple
                let token =  (try? Keychain().get("Token")) ?? ""
                state.authModel?.name = nickname
                state.authModel?.email = email
                state.authModel?.token = token
                state.authModel?.socialType = socialType
                guard let auth = state.authModel
                else { return .none}
                state.auth.append(auth)
                return .none
                
                
            case .presntLoginBottomSheet:
                let email: String = (try? Keychain().get("EMAIL")) ?? ""
                let nickname: String = (try? Keychain().get("NAME")) ?? ""
                let socialTypeDesc: String = ( try? Keychain().get("SocialType")) ?? ""
                let socialType: SocialType = SocialType(rawValue: socialTypeDesc) ?? .apple
                let token =  (try? Keychain().get("Token")) ?? ""
                let login: String = (try? Keychain().get("isLogin")) ?? ""
                state.destination = .login(LoginFeature.State(auth: UserAuth(isLogin: Bool(login), token: token, socialType: socialType, name: nickname, email: email)))
                return .none
                
                
            case .presntProfileData:
                let email: String = (try? Keychain().get("EMAIL")) ?? ""
                let nickname: String = (try? Keychain().get("NAME")) ?? ""
                let socialTypeDesc: String = ( try? Keychain().get("SocialType")) ?? ""
                let socialType: SocialType = SocialType(rawValue: socialTypeDesc) ?? .apple
                let token =  (try? Keychain().get("Token")) ?? ""
                let login: String = (try? Keychain().get("isLogin")) ?? ""
                state.destination = .profile(ProfileFeature.State(auth: UserAuth(isLogin: Bool(login), token: token, socialType: socialType, name: nickname, email: email)))
                return .none
                
                
                
            case .addLoginBottomSheet:
                guard let auth = state.destination?.login,
                        let auths = auth.auth
                else { return .none}
                //
                state.auth.append(auths)
                state.authModel = auths
                state.destination = nil
                return .run { send in
                    switch auths.socialType {
                    case .apple:
                        switch auths.isLogin {
                        case true:
                            await send(.presntProfileData)
                            try await self.clock.sleep(for: .milliseconds(300))
                            
                        case false:
                            print("로그인 실패")
                        default:
                            break
                        }
                    case .kakao:
                        switch auths.isLogin {
                        case true:
                            await send(.presntProfileData)
                            try await self.clock.sleep(for: .milliseconds(600))
                            
                        case false:
                            Log.debug("로그인 실패")
                        default:
                            break
                        }
                    case .none:
                        break
                    default:
                        break
                    }
                }
            case .binding(_):
                return .none
                
            default:
                return .none
            }
            
        }
        
        //MARK: - 예전에 하나 씩 iflet 바인딩으로 넘기는 방식
        //  .ifLet(\.$loginFeature, action: \.presentBottomSheet) {
        //     LoginFeature()
        //   }
        //
        //   .ifLet(\.$profileFeature, action: \.presentProfile) {
        //            ProfileFeature()
        //        }
        
        //MARK: - 멀티플로 stack 처럼 넘기는 방식
        .ifLet(\.$destination, action: \.destination)
        .onChange(of: \.authModel) { oldValue, newValue in
            Reduce { state, action in
                state.authModel = newValue
                return .none
            }
        }
    }
}

