//
//  WithDrawFeature.swift
//  Profile
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

import Model
import ComposableArchitecture


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
        public init(
            auth: UserAuth?  = nil
        ) {
            self.auth = auth
        }
    }
    
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(_):
                return .none
            }
        }
    }
}

