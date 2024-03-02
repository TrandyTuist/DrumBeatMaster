//
//  SignUpView.swift
//  Auth
//
//  Created by 서원지 on 3/2/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import SwiftUI

import ComposableArchitecture

import DesignSystem

public struct SignUpView: View {
    @Bindable var store: StoreOf<SignUpFeature>
    var backAction: () -> Void = { }
    
    public init(
        store: StoreOf<SignUpFeature>,
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
