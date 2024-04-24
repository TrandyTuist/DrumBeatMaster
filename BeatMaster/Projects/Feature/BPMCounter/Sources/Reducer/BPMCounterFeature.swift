//
//  BPMCounterFeature.swift
//  BPMCounter
//
//  Created by 서원지 on 4/24/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct BPMCounterFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        var title: String = "BPMCounterView"
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

