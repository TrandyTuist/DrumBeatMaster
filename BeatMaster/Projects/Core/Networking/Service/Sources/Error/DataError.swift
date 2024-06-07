//
//  DataError.swift
//  Service
//
//  Created by 서원지 on 6/6/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation

enum DataError: Error {
    case error(Error)
    case emptyValue
    case invalidatedType
    case decodingError(Error)
    case statusCodeError(Int)
}
