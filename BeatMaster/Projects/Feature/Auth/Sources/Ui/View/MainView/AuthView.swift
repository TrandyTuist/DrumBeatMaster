//
//  AuthView.swift
//  Auth
//
//  Created by 서원지 on 2/25/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import DesignSystem
import ComposableArchitecture


public struct AuthView: View {
    @Bindable var store: StoreOf<AuthFeature>
    var backAction: () -> Void = { }
    var loginAction: () -> Void = { }
    
    public init(
        store: StoreOf<AuthFeature>,
        backAction: @escaping () -> Void,
        loginAction: @escaping () -> Void
    ) {
        self.store = store
        self.backAction = backAction
        self.loginAction = loginAction
    }
    
    public var body: some View {
        VStack(spacing: .zero) {
            
            Spacer()
                .frame(height: 20)
            
            NavigationBackButton(buttonAction: backAction)
            
            logoImage()
            
            Spacer()
                .frame(height: 20)
            
            BounceAnimationView(text: store.state.authMainViewTitle, startTime: 0.0, fontSize: 40)
            
            loginButtonView()
            
            signUpButtonView()
            
            Spacer()
        }
    }
}


fileprivate extension AuthView {
    
    @ViewBuilder
    private func logoImage() -> some View {
        LazyVStack {
            Spacer()
                .frame(height: UIScreen.screenHeight*0.1)
            
            Image(asset: self.store.state.authMainImage)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.screenWidth*0.5, height: 200)
        }
    }
    
    @ViewBuilder
    private func loginButtonView() -> some View {
        Spacer()
            .frame(height: UIScreen.screenHeight*0.2)
        
        
        LazyVStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.primaryOrange, style: .init(lineWidth: 2))
                .frame(height: 56)
                .overlay {
                    Text("로그인하기")
                        .foregroundStyle(Color.primaryOrangeText)
                        .pretendardFont(family: .SemiBold, size: 16)
                    
                }
                .onTapGesture {
                    loginAction()
                }
            
        }
        .padding(.horizontal, 20)
    }
    
    
    @ViewBuilder
    private func signUpButtonView() -> some View {
        Spacer()
            .frame(height: 8)
        
        LazyVStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.primaryOrange)
                .frame(height: 56)
                .overlay {
                    Text("회원가입 하기")
                        .foregroundStyle(Color.basicWhite)
                        .pretendardFont(family: .SemiBold, size: 16)
                    
                }
            
        }
        .padding(.horizontal, 20)
    }
}

