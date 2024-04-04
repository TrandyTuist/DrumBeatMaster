//
//  SelectJob.swift
//  Model
//
//  Created by 서원지 on 3/27/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

public enum SelectJob: String, CaseIterable {
    case drummer
    case drumlesson
    case hobbyDrum
    
    public var desc: String {
        switch self {
        case .drummer:
            return "드러머/연주자"
        case .drumlesson:
            return "드럼레슨생"
        case .hobbyDrum:
            return "드럼 취미생"
        }
    }
    
}

