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
        ZStack {
            Color.basicGray2
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 20)
                
                NavigationTitleBackButton(buttonAction: backAction, title: "설정")
                 
                userAccount()
                
                appMangementList()
                
                logoutButton()
               
                Spacer()
            }
        }
    }
}
   
fileprivate extension ProfileView {
    
    @ViewBuilder
    private func userAccount() -> some View {
        Spacer()
            .frame(height:  24)
        
        LazyVStack {
            HStack {
                Text(store.auth?.name ?? "")
                    .pretendardFont(family: .SemiBold, size: 30)
                    .foregroundColor(Color.basicBlackDimmed)
                
                
                Spacer()
            }
            
            
//            Spacer()
//                .frame(height: 8)
//            
//            HStack {
//                Text(store.auth?.email ?? "")
//                    .pretendardFont(family: .SemiBold, size: 20)
//                    .foregroundColor(Color.basicBlackDimmed)
//                
//                
//                Spacer()
//            }
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func appMangementList() -> some View {
        LazyVStack {
            Spacer()
                .frame(height:  20)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.basicWhite)
                .frame(height: UIScreen.screenHeight*0.35)
                .overlay {
                    LazyVStack {
                        ForEach(store.profileViewList) { profileComponent in
                            profileListView(imageName: profileComponent.imageName, content: profileComponent.content, detail: profileComponent.detail)
                                .onTapGesture {
                                    switch profileComponent.imageName {
                                    case "review":
                                        store.send(.tapReview)
                                    case "bug":
                                        store.send(.tapBug)
                                    case "setting":
                                        store.send(.presentSetting)
                                        
                                    default:
                                        break
                                    }
                                }
                            if profileComponent.isDevider {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 80, height: 1)
                                    .foregroundColor(.basicGray4)
                            }
                        }
                    }
                }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func profileListView(
        imageName: String,
        content: String,
        detail: String
    ) -> some View {
        HStack {
            Image(assetName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40,height: 40)
                .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 10))
            
            VStack(alignment: .leading) {
                Text(content)
                    .pretendardFont(family: .Medium, size: 16)
                    .foregroundColor(.basicGray8)
                Spacer()
                    .frame(height: 2)
                Text(detail)
                    .pretendardFont(family: .Regular, size: 12)
                    .foregroundColor(.basicGray6)
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .padding(.trailing, 25)
        }
    }
    
    @ViewBuilder
    private func logoutButton() -> some View {
        Spacer()
            .frame(height: UIScreen.screenHeight*0.3)
        
        LazyVStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.lightPurple200)
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


