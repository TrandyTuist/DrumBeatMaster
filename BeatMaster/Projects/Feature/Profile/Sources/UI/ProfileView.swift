//
//  base.swift
//  BeatMaster
//
//  Created by 서원지 on 2024/03/26
//  Copyright © 2024 Team.hae.jo, All rights reserved.
//

import SwiftUI

import DesignSystem

import ComposableArchitecture

public struct ProfileView: View {
    @Bindable var store : StoreOf<ProfileFeature>
    var backAction: () -> Void = { }
    
    public init(
        store: StoreOf<ProfileFeature>,
        backAction: @escaping () -> Void
    ) {
        self.store = store
        self.backAction = backAction
    }
    
    public var body: some View {
        VStack {
            Spacer()
                .frame(height: 20)
            
            NavigationTitleBackButton(buttonAction: backAction, title: "설정")
             
            userAccount()
            
            logoutButton()
           
            Spacer()
        }
    }
}
   
fileprivate extension ProfileView {
    
    @ViewBuilder
    private func userAccount() -> some View {
        Spacer()
            .frame(height: 40)
        
        LazyVStack {
            HStack {
                Text(store.auth?.name ?? "")
                    .pretendardFont(family: .SemiBold, size: 30)
                    .foregroundColor(Color.basicBlackDimmed)
                
                
                Spacer()
            }
            Spacer()
                .frame(height: 8)
            
            HStack {
                Text(store.auth?.email ?? "")
                    .pretendardFont(family: .SemiBold, size: 20)
                    .foregroundColor(Color.basicBlackDimmed)
                
                
                Spacer()
            }
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func logoutButton() -> some View {
        Spacer()
            .frame(height: UIScreen.screenHeight*0.65)
        
        LazyVStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.lightPurple)
                .frame(height: 56)
                .overlay {
                    Text("로그아웃")
                        .pretendardFont(family: .Bold, size: 20)
                        .foregroundColor(Color.basicWhite)
                }
                .onTapGesture {
                    store.send(.logout)
                    backAction()
                }
            
        }
        .padding(.horizontal, 20)
    }
}


