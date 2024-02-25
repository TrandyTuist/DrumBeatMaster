//
//  SplashFeature.swift
//  Splash
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import DesignSystem

@Reducer
public struct SplashFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
         var splashTitle: String = "BeatMaster"
         var splashImage: ImageAsset = .empty
        
        public init() {}
    }
    
    @Dependency(\.continuousClock) var clock
    
    public enum Action {
        case appearLogoImage
        case presentRootView
        case logoImage
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .appearLogoImage:
                return .run { send in
                    try await self.clock.sleep(for: .milliseconds(300))
                    await send(.presentRootView, animation: .easeOut(duration: 1))
                }
                
            case .logoImage:
                state.splashImage = .splash
                return .none
                
            case .presentRootView:
                return .none
                
                
            }
        }
    }
}


