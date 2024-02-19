//
//  SplashFeature.swift
//  Splash
//
//  Created by 서원지 on 2/18/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct SplashFeature {
    public init() {}
    
    @ObservableState
     public struct State {
         public init() {}
         var isLogoHidden: Bool = true
    }
    
    @Dependency(\.continuousClock) var clock
    
    public enum Action {
        case appearLogoImage
        case presentRootView
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .appearLogoImage:
                state.isLogoHidden = false
                return .run { send in
                    try await self.clock.sleep(for: .milliseconds(800))
                    await send(.presentRootView, animation: .easeOut(duration: 1))
                }
                
            case .presentRootView:
                return .none
                
                
            }
        }
    }
}

