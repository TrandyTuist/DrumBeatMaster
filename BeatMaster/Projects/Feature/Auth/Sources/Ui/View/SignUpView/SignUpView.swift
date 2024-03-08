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
            
            policyTitle()
            
            serviceUseAgreeTextView()
            
            Spacer()
            
        }
    }
}


fileprivate extension SignUpView {
    
    @ViewBuilder
    private func policyTitle() -> some View {
        Spacer()
            .frame(height: 20)
        
        VStack(spacing: .zero) {
            HStack {
                Text(store.state.policyTitle)
                    .pretendardFont(family: .SemiBold, size: 24)
                    .foregroundColor(Color.lightPurple)
                
                Text("에")
                    .pretendardFont(family: .SemiBold, size: 24)
                    .foregroundColor(Color.basicBlack)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("동의해주세요")
                    .pretendardFont(family: .SemiBold, size: 24)
                    .foregroundColor(Color.basicBlack)
                Spacer()
            }
            .padding(.horizontal, 20)
        }
       
        
    }
    
    @ViewBuilder
    private func serviceUseAgreeTextView() -> some View {
        Spacer()
            .frame(height: 20)
        
        AgreeMentListView(
            checkAgreeButton: $store.isAllAgreed,
            showleft: false,
            title: "서비스 이용약관 동의",
            agreeAllService: false,
            essential: .essential,
            safariURL: "",
            webViewLoading: .constant(false),
            confirmAction: {
                store.send(.didTapAgreeAllPolicy)
            }
        )
    }
    
    
    
    
}
