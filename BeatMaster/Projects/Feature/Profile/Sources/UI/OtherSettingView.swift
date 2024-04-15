//
//  OtherSettingView.swift
//  Profile
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI

import DesignSystem
import Model
import ComposableArchitecture


public struct OtherSettingView: View {
    @Bindable var store: StoreOf<OtherSettingFeature>
    var backAction: () -> Void =  { }
     
    
    public init(
        store: StoreOf<OtherSettingFeature>,
        backAction: @escaping() -> Void 
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
                
                NavigationTitleBackButton(buttonAction: backAction, title: "기타설정")
                 
                otherSettingList()
               
                Spacer()
            }
        }
    }
}


fileprivate extension OtherSettingView {
    
    @ViewBuilder
    private func otherSettingList() -> some View {
        VStack{
            Spacer()
                .frame(height: 20)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.basicWhite)
                .frame(height: UIScreen.screenHeight*0.35)
                .padding(.horizontal, 20)
                .overlay {
                    VStack {
                        ForEach(OtherSettingItem.allCases, id: \.self) { item in
                            listItemView(
                                showArrow:  item != .appVersion ? true : false,
                                showLine: item == .privacyPolicy
                                || item == .termsOfService
                                || item == .marketingTerm
                                || item == .withDraw ? true : false,
                                text:  item.description,
                                versionText:  item == .appVersion ? "v.\(store.appVersion )": "") {
                                    switch item {
                                    case .privacyPolicy:
                                        store.send(.presentPrivacyPolicyWeb)
                                    case .termsOfService:
                                        store.send(.presentTermsOfServiceWeb)
                                    case .marketingTerm:
                                        store.send(.presentMarketingTerm)
                                    case .withDraw:
                                        store.send(.presentWthDraw)
                                    case .appVersion:
                                        break
                                   
                                    }
                                }
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    private func listItemView(
        showArrow: Bool,
        showLine: Bool,
        text: String,
        versionText: String ,
        goToDeatilView: @escaping () -> Void
    ) -> some View {
        VStack(spacing: .zero) {
            Spacer()
                .frame(height: 20)
            
            HStack {
                Spacer()
                    .frame(width: 10)
                Text(text)
                    .foregroundColor(Color.basicGray9)
                    .pretendardFont(family: .Medium, size: 16)
                
                Spacer()
                
                if showArrow {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 6, height: 12)
                    
                }
                else {
                    Text(versionText)
                        .foregroundColor(Color.basicGray9)
                        .pretendardFont(family: .Medium, size: 14)
                }
                Spacer()
                    .frame(width: 10)
                
            }
            .onTapGesture {
                if showArrow {
                    goToDeatilView()
                }
            }
            
            Spacer()
                .frame(height: 20)
            
            if showLine {
                Rectangle()
                    .fill(Color.basicGray4)
                    .frame(height: 1)
                    .padding(.horizontal, 10)
            }
        }
        .padding(.horizontal, 20)
        
    }
}
