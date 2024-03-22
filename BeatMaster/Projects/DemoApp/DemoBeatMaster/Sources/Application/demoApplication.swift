//
//  demoApplication.stencil.swift
//  BeatMaster
//
//  Created by 서원지 on 2024/01/14
//  Copyright © 2024 Team.hae.jo , Ltd. All rights reserved.
//

import SwiftUI
import Splash
import ComposableArchitecture
import Auth

@main
struct DemoBeatMaster: App {
    var body: some Scene {
        WindowGroup {
            SplashView(
                store:
                    Store(
                        initialState: SplashFeature.State(),
                        reducer: {
                SplashFeature()
            }))
        }
    }
}
