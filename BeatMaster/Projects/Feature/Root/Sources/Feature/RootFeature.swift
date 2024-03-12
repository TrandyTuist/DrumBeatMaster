//
//  RootFeature.swift
//  Root
//
//  Created by 서원지 on 2/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Auth
import Model

import ComposableArchitecture

@Reducer
public struct RootFeature{
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        
        var title: String = "Root"
        var isLogin: Bool = false
        var path: StackState<Path.State> = .init()
    }
    
    public enum Action {
        case path(StackAction<Path.State, Path.Action>)
        case presentAuth
        case isLoginPresntAuth
        case removePath
        case removeAllPath
    }
    
    @Reducer(state: .equatable)
    public enum Path {
        case auth(AuthFeature)
        case login(LoginFeature)
        case signUp(SignUpFeature)
    }
    
    //MARK: - 1.8 이하 버전 path 추가
//    @Reducer
//    public struct Path {
//        public init() {}
//        
//        
//        @ObservableState
//        public enum State: Equatable {
//            case auth(AuthFeature.State)
//        }
//        
//        public enum Action: Equatable {
//            case auth(AuthFeature.Action)
//        }
//        
//        
//        public var body: some ReducerOf<Self> {
//            Scope(state: /State.auth, action: /Action.auth) {
//                AuthFeature()
//            }
//        }
//    }
    
    
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
//            case .path:
//                return .none
                
            case .isLoginPresntAuth:
//                if state.userModel.first?.isLogin == true {
//                    state.userModel.append(Auth(isLogin: true, token: "", name: "", email: ""))
//                } else {
//                    state.userModel.append(Auth(isLogin: false, token: "", name: "", email: ""))
//                }
                
                return .none
                
            case .presentAuth:
                state.path.append(.auth(.init()))
                return .none
                
            case .path(.element(id:_, action: .auth(.presentLogin))):
                state.path.append(.login(.init()))
                return .none
                
            case .path(.element(id: _, action: .auth(.presentSignUp))):
                state.path.append(.signUp(.init()))
                return .none
                
            case .removePath:
                state.path.removeLast()
                return .none
                
            case .removeAllPath:
                state.path.removeAll()
                return .none
                
            default:
                return .none
            }
        }
        //MARK: -  1.8 이하
//        .forEach(\.path, action: \.path) {
//            Path()
//        }
        .forEach(\.path, action: \.path)
    }
}

