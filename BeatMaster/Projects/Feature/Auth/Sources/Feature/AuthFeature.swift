//
//  AuthFeature.swift
//  Auth
//
//  Created by 서원지 on 2/20/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct AuthFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        var title: String = "Auth"
        public init() {}
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

