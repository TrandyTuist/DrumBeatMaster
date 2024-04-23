//
//  WithDrawModifier.swift
//  DesignSystem
//
//  Created by 서원지 on 4/22/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI

public struct WithDrawModifier: ViewModifier {
    @Binding var isPresnt: Bool
    let alert: WithDrawPOPUP
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresnt){
                ZStack {
                    Color.clear
                        .edgesIgnoringSafeArea(.all)
                    alert
                }
                .onTapGesture {
                    isPresnt = false
                }
            }
    }
}


extension View {
    public func withDrawAlert(isPresnt: Binding<Bool>, withDrawAlert: @escaping () -> WithDrawPOPUP) -> some View {
        return modifier(WithDrawModifier(isPresnt: isPresnt, alert: withDrawAlert()))
    }
}

