//
//  DropdownMenuItemView.swift
//  DesignSystem
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//



import SwiftUI
import Model

struct DropdownMenuItemView: View {
    @Binding var isSelecting: Bool
    @Binding var selectiontitle: String
    @Binding var selectionId: Int
    
    let item: DropdownItem
    
    var body: some View {
        Button(action: {
            isSelecting = false
            selectiontitle = item.title
            item.onSelect()
        }) {
            HStack {
                Text(item.title)
                    .foregroundColor(.basicGray9)
                    .pretendardFont(family: .Medium, size: 16)
                    .padding(.leading, 16)
                
                Spacer()
            }
            .frame(width: UIScreen.screenWidth - 40, height: 48)
        }
    }
}

