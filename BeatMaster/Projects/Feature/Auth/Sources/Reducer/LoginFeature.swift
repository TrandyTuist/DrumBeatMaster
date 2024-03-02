//
//  LoginFeature.swift
//  Auth
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import DesignSystem

@Reducer
public struct LoginFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var loginMainImage: ImageAsset = .logoIcon
        var loginMainViewTitle: String = "BeatMaster"
        
        public init() {}
    }
    
    public enum Action: Equatable {
        case backAction
    }
    
    @Dependency(\.dismiss) var dismiss
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backAction:
                return .run { _ in 
                    await self.dismiss()
                    
                }
            }
        }
    }
}
