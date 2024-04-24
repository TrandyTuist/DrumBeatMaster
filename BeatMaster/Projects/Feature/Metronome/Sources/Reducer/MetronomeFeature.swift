//
//  MetronomeFeature.swift
//  Metronome
//
//  Created by 서원지 on 4/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct MetronomeFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        var title: String = "MetronomeView"
    }
    
    public enum Action: Equatable {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}

