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

public struct BPMCounterView: View {
    @Bindable var store: StoreOf<BPMCounterFeature>
    
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
                    Text(store.title)
                }
        }
    }
}

