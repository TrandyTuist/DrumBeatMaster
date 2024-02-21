//
//  base.swift
//  BeatMaster
//
//  Created by 서원지 on 2024/01/14
//  Copyright © 2024 Team.hae.jo, All rights reserved.
//

import SwiftUI
import ComposableArchitecture

import Splash
import Root


struct BaseView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}


#if DEV || DEBUG
#Preview {
    SplashView(
        store:
            Store(
                initialState: SplashFeature.State(), reducer: {
                    SplashFeature()
                }
            )
    )
}
#endif

#if DEV || DEBUG
#Preview {
    RootView(
        store:
            Store(
                initialState: RootFeature.State(), reducer: {
                    RootFeature()
                }
            )
    )
}
#endif
