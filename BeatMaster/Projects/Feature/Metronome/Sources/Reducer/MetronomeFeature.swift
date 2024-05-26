//
//  MetronomeFeature.swift
//  Metronome
//
//  Created by 서원지 on 4/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Service

@Reducer
public struct MetronomeFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        var title: String = "MetronomeView"
    }
    
    public enum Action: Equatable {
        case playMetronome
        case tapBeat
        case tapMeter
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .playMetronome:
                Log.debug("playMeronme touch")
                return .none
            case .tapBeat:
                return .none
            case .tapMeter:
                return .none
            }
        }
    }
}

