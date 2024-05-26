//
//  BPMCounterFeature.swift
//  BPMCounter
//
//  Created by 서원지 on 4/24/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import Service
import SwiftUI

@Reducer
public struct BPMCounterFeature {
    public init() {}
    
    @ObservableState
    public struct State: Equatable {
        public init() {}
        var title: String = "BPMCounterView"
        var counterRange: ClosedRange<Int> = 1...4
        var counterTap: Int = 0
        var tapCounts: [Int: Int] = [:]
        var changeStroke: Color =  Color.lightPurple100
        var changeColor: Color =  Color.lightPurple100
    }
    
    public enum Action: Equatable {
        case handleButtonTap(item: Int)
        case handleButtonColor(item: Int)
        case updateCounterTap(item: Int)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .updateCounterTap(item : item):
                state.counterTap = item
                return .none
                
            case let .handleButtonTap(item : item):
                state.counterTap = item
                return .run { send in
                    await send(.handleButtonColor(item: item))
                }
                
            case let .handleButtonColor(item : item):
                state.tapCounts[item, default: 0] += 1
                switch  state.tapCounts[item,  default: 0] {
                case 0:
                    state.changeStroke = Color.lightPurple100
                    state.changeColor = Color.lightPurple100
                    Log.debug(state.changeColor, state.tapCounts)
                case 1:
                    state.changeStroke = Color.lightPurple200
                    state.changeColor = Color.lightPurple100.opacity(0.3)
                    Log.debug(state.changeColor, state.tapCounts)
                case 2:
                    Log.debug(state.changeColor, state.tapCounts)
                case 3:
                    Log.debug(state.changeColor, state.tapCounts)
                case 4:
                    state.changeStroke = Color.lightPurple100
                    Log.debug(state.changeColor, state.tapCounts)
                default:
                    state.changeStroke = Color.lightPurple100
                    state.tapCounts[item] = 0
                    state.changeColor = Color.lightPurple100
                    Log.debug(state.changeColor, state.tapCounts)
                }
                return .none
            }
        }
    }
}

