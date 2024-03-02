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
        var title: String = "SignUp"
        public init() {}
    }
    
    public enum Action: Equatable {
        case presentSignUp
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .presentSignUp:
                return .none
            }
        }
    }
}

