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
            
            logoImage()
            
            Spacer()
                .frame(height: 20)
            
            BounceAnimationView(text: store.state.loginMainViewTitle, startTime: 0.0, fontSize: 40)
            
            appleLoginButton()
            
            kakoTalkLoginButton()
               
            Spacer()
        }
    }
    
}

fileprivate extension LoginView {
    
    @ViewBuilder
    private func logoImage() -> some View {
        LazyVStack {
            Spacer()
                .frame(height: UIScreen.screenHeight*0.1)
            
            Image(asset: self.store.state.loginMainImage)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screenWidth*0.5, height: 200)
        }
    }
    
    @ViewBuilder
    private func appleLoginButton() -> some View {
        Spacer()
            .frame(height: UIScreen.screenHeight*0.2)
        
        LazyVStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.basicBlack.opacity(0.9))
                .frame(height: 56)
                .overlay {
                    Text("애플로 로그인하기")
                        .foregroundStyle(Color.basicWhite)
                        .pretendardFont(family: .SemiBold, size: 16)
                    
                }
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func kakoTalkLoginButton() -> some View {
        Spacer()
            .frame(height: 8)
        
        LazyVStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.basicBlack, style: .init(lineWidth: 2))
                .frame(height: 56)
                .overlay {
                    Text("카카오로 로그인하기")
                        .foregroundStyle(Color.basicBlack)
                        .pretendardFont(family: .SemiBold, size: 16)
                    
                }
            
        }
        .padding(.horizontal, 20)
    }
    
    
    
}
