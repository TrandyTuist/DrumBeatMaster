//
//  AuthView.swift
//  Auth
//
//  Created by 서원지 on 2/20/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI

import DesignSystem

import ComposableArchitecture


public struct AuthView: View {
    @Bindable var store: StoreOf<AuthFeature>
    var backAction: () -> Void = { }
    
    public init(
        store: StoreOf<AuthFeature>,
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


