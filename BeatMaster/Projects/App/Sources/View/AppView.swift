//
//  AppView.swift
//  BeatMaster
//
//  Created by 서원지 on 2/17/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI

import Shareds
import DesignSystem
import Splash
import Root

import ComposableArchitecture

public struct AppView: View {
    let store: StoreOf<AppFeature>
    
    public init(
        store: StoreOf<AppFeature>
    ) {
           self.store = store
       }
       
    
    public var body: some View {
        SwitchStore(store) { state in
            switch state {
            case .splash:
                if let store = store.scope(state: \.splash, action: \.splash) {
                    SplashView(store: store)
                }
                    
                
            case .root:
                if let store = store.scope(state: \.root, action: \.root) {
                    RootView(store: store)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                store.send(.presentRootView)
            }
        }
    }
}

#Preview {
    AppView(store: Store(initialState: AppFeature.State(), reducer: {
        AppFeature()
    }))
}
