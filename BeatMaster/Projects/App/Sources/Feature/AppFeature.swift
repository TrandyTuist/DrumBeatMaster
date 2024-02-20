//
//  AppFeature.swift
//  BeatMaster
//
//  Created by 서원지 on 2/17/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import SwiftUI
import Splash

@Reducer
public struct AppFeature {
    public init() {}
    
    @ObservableState
    public enum State {
        case splash(SplashFeature.State)
        
        public init() {
            self = .splash(SplashFeature.State())
        }
    }
    
    public enum Action {
        case presentSplashView
        case splash(SplashFeature.Action)
    }
    
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .splash(.presentRootView):
                return .none
                
            default:
                return .none
            }
        }
    }
}

