//
//  Extension+Data.swift
//  Service
//
//  Created by 서원지 on 6/6/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Combine

// Data 타입의 확장으로 공용 디코딩 함수 정의
extension Data {
    //MARK: -  async/ await 으로 디코딩
    func decoded<T: Decodable>(as type: T.Type) throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
    
    //MARK: - 컴바인으로 디코딩
    func decodedToCombine<T: Decodable>(as type: T.Type) -> AnyPublisher<T, DataError> {
        Future { promise in
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: self)
                promise(.success(decodedObject))
            } catch {
                promise(.failure(.error(error)))
            }
        }
        .eraseToAnyPublisher()
    }
}
