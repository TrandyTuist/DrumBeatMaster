//
//  ProfileComponentModel.swift
//  Model
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

public struct ProfileComponentModel: Identifiable, Equatable {
    public var isDevider: Bool
    public var imageName: String
    public var id: UUID
    public var content: String
    public var detail: String
    
    public init(
        isDevider: Bool,
        imageName: String, 
        content: String,
        detail: String
    ) {
        self.isDevider = isDevider
        self.imageName = imageName
        self.id = UUID()
        self.content = content
        self.detail = detail
    }
}


