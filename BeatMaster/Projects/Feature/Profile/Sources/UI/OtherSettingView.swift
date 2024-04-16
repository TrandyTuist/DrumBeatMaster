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
        LazyVStack{
            Spacer()
                .frame(height: 20)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.basicWhite)
                .frame(height: UIScreen.screenHeight*0.45)
                .overlay {
                    LazyVStack {
                        ForEach(store.otherSettingList) { otherSettingComponent in
                            otherSettingListView(imageName: otherSettingComponent.imageName, content: otherSettingComponent.content, detail: otherSettingComponent.detail, notShowLeft: otherSettingComponent.notShowLeft)
                                .onTapGesture {
                                    switch otherSettingComponent.imageName {
                                    case "termsOfService":
                                        store.send(.presentPrivacyPolicyWeb)
                                    case "privacyPolicy":
                                        store.send(.presentTermsOfServiceWeb)
                                    case "marketingTerm":
                                        store.send(.presentMarketingTerm)
                                    case "withDraw":
                                        store.send(.presentWthDraw)
                                        
                                    default:
                                        break
                                    }
                                }

                            if otherSettingComponent.isDevider {
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
    private func otherSettingListView(
        imageName: String,
        content: String,
        detail: String,
        notShowLeft: Bool
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
            
            if notShowLeft {
                Text("v.\(store.appVersion)")
                    .pretendardFont(family: .Regular, size: 12)
                    .foregroundColor(.basicGray6)
                    .padding(.trailing, 25)
            } else {
                Image(systemName: "chevron.right")
                    .padding(.trailing, 25)
            }
        }
    }
    
}
