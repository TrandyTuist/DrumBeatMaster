//
//  AuthInfromationView.swift
//  Auth
//
//  Created by 서원지 on 3/17/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import DesignSystem

import ComposableArchitecture

public struct AuthInfromationView: View {
    @Bindable var store: StoreOf<AuthInfromationFeature>
    var backAction: ()  -> Void = { }
    
    public init(
        store: StoreOf<AuthInfromationFeature>,
        backAction: @escaping () -> Void
    ) {
        self.store = store
        self.backAction = backAction
    }
    

    
   public  var body: some View {
       VStack {
           Spacer()
               .frame(height: 20)
           
           NavigationBackButton(buttonAction: {
               self.store.send(.backAction)
               
               backAction()
           })
           
           Spacer()
               .frame(height: 30)
           
           headerView()
           
           signupSocailType()
           
           
           Spacer()
           
       }
       .onAppear {
       }
    }
}

fileprivate extension AuthInfromationView {
    
    @ViewBuilder
    private func headerView() -> some View {
        LazyVStack  {
            HStack {
                Text(self.store.title)
                    .pretendardFont(family: .SemiBold, size: 30)
                    .foregroundColor(Color.basicBlack)
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private func signupSocailType() -> some View {
         LazyVStack {
             HStack {
                 Text(self.store.auth?.socialType?.desc ?? "")
                     .pretendardFont(family: .SemiBold, size: 30)
                     .foregroundColor(Color.basicBlack)
                 
                 Spacer()
             }
        }
         .padding(.horizontal, 20)
    }
}
