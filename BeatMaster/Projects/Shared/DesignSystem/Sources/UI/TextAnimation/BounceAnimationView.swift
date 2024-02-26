//
//  BounceAnimationView.swift
//  DesignSystem
//
//  Created by 서원지 on 2/19/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import SwiftUI

public struct BounceAnimationView: View {
    let characters: Array<String.Element>
    let fontSize: CGFloat
    
    @State var offsetYForBounce: CGFloat = -50
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    
    public init(
        text: String,
        startTime: Double,
        fontSize: CGFloat
    ){
        self.characters = Array(text)
        self.baseTime = startTime
        self.fontSize = fontSize
    }
    
    public var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .pretendardFont(family: .Bold, size: fontSize)
                    .offset(x: 0.0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1).delay( Double(num) * 0.1 ), value: offsetYForBounce)
            }
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                    opacity = 0
                    offsetYForBounce = -50
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.4 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
        }
    }
}
