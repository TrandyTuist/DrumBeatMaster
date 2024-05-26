//
//  MetronomeView.swift
//  Metronome
//
//  Created by 서원지 on 4/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import DesignSystem
import ComposableArchitecture

public struct MetronomeView: View {
    @Bindable var store: StoreOf<MetronomeFeature>
    
    public init(
        store: StoreOf<MetronomeFeature>
    ) {
        self.store = store
    }
    public var body: some View {
        VStack {
            tapPlayMetronomeButton()
        }
    }
    
}



extension MetronomeView {
    
    @ViewBuilder
    private func tapPlayMetronomeButton() -> some View {
        ZStack {
            Color.basicGray2
                .edgesIgnoringSafeArea(.all)
            
            
            Circle()
                .stroke(Color.basicGray4, style: .init(lineWidth: 2))
                .fill(Color.basicWhite)
                .frame(width: 150, height: 150)
                .onTapGesture {
                    store.send(.playMetronome)
                }
            
        }
    }
}
