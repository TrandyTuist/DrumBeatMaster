//
//  OtherSettingComponentModel.swift
//  Model
//
//  Created by 서원지 on 4/16/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

public struct OtherSettingComponentModel: Identifiable, Equatable {
    public var isDevider: Bool
    public var imageName: String
    public var id: UUID
    public var content: String
    public var detail: String
    public var notShowLeft: Bool
    
    public init(
        isDevider: Bool,
        imageName: String,
        content: String,
        detail: String,
        notShowLeft: Bool
    ) {
        self.isDevider = isDevider
        self.imageName = imageName
        self.id = UUID()
        self.content = content
        self.detail = detail
        self.notShowLeft = notShowLeft
    }
}
