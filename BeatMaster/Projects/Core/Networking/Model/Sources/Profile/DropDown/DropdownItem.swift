//
//  DropdownItem.swift
//  Model
//
//  Created by 서원지 on 4/15/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

public struct DropdownItem: Identifiable {
    public let id: Int
    public let title: String
    public let onSelect: () -> Void
    
    public init(
        id: Int,
        title: String,
        onSelect: @escaping () -> Void
    ) {
        self.id = id
        self.title = title
        self.onSelect = onSelect
    }
}

