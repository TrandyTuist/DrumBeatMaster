//
//  BPMCounterView.swift
//  BPMCounter
//
//  Created by 서원지 on 4/24/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import DesignSystem
import Service

public struct BPMCounterView: View {
     let store: StoreOf<BPMCounterFeature>
    
    public init(
        store: StoreOf<BPMCounterFeature>
    ) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.basicBlack.opacity(0.5))
                .frame(height: UIScreen.screenHeight*0.4)
                .overlay {
                    countingMetronmoeView()
                }
        }
    }
}

fileprivate extension BPMCounterView {
    
    @ViewBuilder
    private func countingMetronmoeView() -> some View {
        LazyVStack {
            HStack {
                ForEach(store.counterRange, id: \.self) {item  in
                    circleMetronomeButton(tapItem: item)
                        .onTapGesture {
                            store.send(.updateCounterTap(item: item))
                            store.send(.handleButtonTap(item: item))
                        }
                    
                    if item == 1 && item == 4 {
                        
                    } else {
                        Spacer()
                            .frame(width: 30)
                    }
                }
            }
            .offset(x: 10)
        }
    }
    
    @ViewBuilder
    private func circleMetronomeButton(tapItem: Int) -> some View {
        HStack (alignment: .center){
            Circle()
                .stroke(store.state.tapCounts[tapItem] == store.state.tapCounts[store.state.counterTap] ? store.state.changeStroke : Color.lightPurple100)
                .fill(store.state.tapCounts[tapItem] == store.state.tapCounts[store.state.counterTap] ? store.state.changeColor : Color.lightPurple100)
                .frame(width: 60, height: 60)
        }
    }
}

