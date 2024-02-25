//
//  SplashView.swift
//  Splash
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import DesignSystem

public struct SplashView: View {
    @Bindable var store: StoreOf<SplashFeature>
    
    public init(store: StoreOf<SplashFeature>) {
        self.store = store
    }
    
    public var body: some View {
        ZStack {
            Color.lightPurple
                .edgesIgnoringSafeArea(.all)
            
            LazyVStack(spacing: .zero) {
                Image(asset: store.splashImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth*0.5, height: UIScreen.screenHeight*0.2)
                   
                
                Spacer()
                    .frame(height: 20)
                
                BounceAnimationView(text: store.state.splashTitle, startTime: 0.0, fontSize: 40)
                    .padding(.horizontal, 20)
                
                Spacer()
                    .frame(height: 20)
                
                
                
                Spacer()
                
            }
            
            .onAppear {
                store.send(.logoImage)
                store.send(.appearLogoImage)
            }
        }
    }
}

