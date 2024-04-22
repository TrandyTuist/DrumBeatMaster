//
//  ClearBackGround.swift
//  DesignSystem
//
//  Created by 서원지 on 4/22/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import SwiftUI
import Foundation

public struct ClearBackground: UIViewRepresentable {
    
    public func makeUIView(context: Context) -> some UIView {
        let view  = ClearBackGroundView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    
}

class ClearBackGroundView: UIView {
    open override func layoutSubviews() {
        guard let parentView = superview?.superview  else {
            return
        }
        parentView.backgroundColor = .clear
    }
}
