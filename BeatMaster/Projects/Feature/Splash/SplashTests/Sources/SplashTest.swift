//
//  SplashTest.swift
//  BeatMaster
//
//  Created by 서원지 on 2024/02/18
//  Copyright © 2024 Team.hae.jo , Ltd. All rights reserved.
//

import XCTest
import ComposableArchitecture
import DesignSystem
//import Splash
@testable import Splash
//
@MainActor
final class SplashTests: XCTestCase {
    func test_이미지로드() async {
        let store = TestStore(initialState: SplashFeature.State()) {
            SplashFeature()
        }
        
        await store.send(.logoImage) {
            $0.splashImage = .splash
        }
    }
}
