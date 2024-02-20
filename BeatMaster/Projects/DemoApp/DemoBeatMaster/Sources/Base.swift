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
