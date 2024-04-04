//
//  NavigationTitleBackButton.swift
//  DesignSystem
//
//  Created by 서원지 on 3/27/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import SwiftUI

public struct NavigationTitleBackButton: View {
    var buttonAction: () -> Void = { }
    var title: String
    
    public init(
        buttonAction: @escaping () -> Void,
        title: String
    ) {
        self.buttonAction = buttonAction
        self.title = title
    }
    
    public var body: some View {
        HStack {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 18)
                    .foregroundColor(.basicGray8)
                
                Text(title)
                    .pretendardFont(family: .SemiBold, size: 18)
                    .foregroundColor(.basicBlack)
                
                
            }
            .onTapGesture {
                buttonAction()
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}
