//
//  LoginView.swift
//  Auth
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import DesignSystem
import ComposableArchitecture


public struct LoginView: View {
    @Bindable var store: StoreOf<LoginFeature>
    var backAction: () -> Void = { }
    
    
    public init(
        store: StoreOf<LoginFeature>,
        backAction: @escaping () -> Void
    ) {
        self.store = store
        self.backAction = backAction
    }
    
    public var body: some View {
        VStack(spacing: .zero) {
            
            Spacer()
                .frame(height: 20)
            
            NavigationBackButton(buttonAction: backAction)
            
            Spacer()
            
            Text(store.state.title)
                .pretendardFont(family: .Bold, size: 40)
            
            Spacer()
            
        }
    }
    
}
