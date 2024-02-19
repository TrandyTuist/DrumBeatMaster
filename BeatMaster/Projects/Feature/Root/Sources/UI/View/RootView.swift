//
//  RootView.swift
//  Root
//
//  Created by 서원지 on 2/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import ComposableArchitecture
import SwiftUI
import DesignSystem

public struct RootView: View {
    @Bindable var store: StoreOf<RootFeature>
    
    public init(store: StoreOf<RootFeature>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            Text(store.state.title)
                .pretendardFont(family: .Bold, size: 40)
        }
    }
}
