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
            Text(store.title)
                .pretendardFont(family: .Medium, size: 30)
                .foregroundColor(Color.basicBlack)
        }
        
    }
}
