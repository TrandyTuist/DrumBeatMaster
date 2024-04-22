//
//  WithDrawView.swift
//  Profile
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import DesignSystem
import ComposableArchitecture

public struct WithDrawView: View {
    @Bindable var store: StoreOf<WithDrawFeature>
    var backAction: () -> Void = { }
    var withDrawAction: () -> Void = { }
    
    public init(
        store: StoreOf<WithDrawFeature>,
        backAction: @escaping () -> Void,
        withDrawAction: @escaping () -> Void
    ) {
        self.store = store
        self.backAction = backAction
        self.withDrawAction = withDrawAction
    }
    
    public var body: some View {
        ZStack {
            Color.basicGray2
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                    .frame(height: 20)
                
                NavigationTitleBackButton(buttonAction: backAction, title: "회원 탈퇴")
                 
                withDrawViewTitle()
                
                withDrawDropDownMenu()
                
                selectWithDrawButton()
                
                Spacer()
               
            }
        }
    }
}


fileprivate extension WithDrawView {
    
    @ViewBuilder
    private func withDrawViewTitle() -> some View {
        Spacer()
            .frame(height: 16)
        
        LazyVStack {
            HStack {
                Text(store.withDrawtitle)
                    .padding(.leading, 20)
                Spacer()
            }
            HStack {
                Text(store.withDrawSubtitle)
                    .padding(.leading, 20)
                Spacer()
            }
        }
        .frame(width: UIScreen.screenWidth, height: 96, alignment: .leading)
        .foregroundColor(.basicGray9)
        
        .pretendardFont(family: .Medium, size: 20)
    }
    
    @ViewBuilder
    private func withDrawDropDownMenu() -> some View {
        VStack {
            CustomDropdownMenu(
                isSelecting: $store.isSelectDropDownMenu,
                selectionTitle: $store.selectWithDrawReason
            )
        }
    }
    
    @ViewBuilder
    private func selectWithDrawButton() -> some View {
        Spacer()
            .frame(height: 28)
        
        if !store.isSelectDropDownMenu {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.basicGray3)
                .frame(height: 56)
                .padding(.horizontal, 20)
                .overlay {
                    Text("탈퇴하기")
                        .foregroundStyle(Color.basicGray6)
                        .pretendardFont(family: .Medium, size: 14)
                    
                }
                .disabled(!store.isSelectDropDownMenu)
                .onTapGesture {
                    store.send(.withDraw(socialType: store.auth?.socialType ?? .unknown){
                        withDrawAction()
                    })
                }
        }
    }
}
