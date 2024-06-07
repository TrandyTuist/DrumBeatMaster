//
//  Extension+MoyaProvider.swift
//  Service
//
//  Created by 서원지 on 6/6/24.
//  Copyright © 2024 Wonji suh. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public extension MoyaProvider {
    //MARK: - MoyaProvider에 요청을 비동기적으로 처리하는 확장 함수 추가
     func requestAsync<T: Decodable>(_ target: Target, decodeTo type: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            
            var cancellable: AnyCancellable?
            cancellable = self.requestWithProgressPublisher(target)
                .compactMap { $0.response?.data }
                .tryCompactMap { data in
                    try data.decoded(as: T.self)
                }
                .mapError {
                    DataError.error($0)
                }
                .eraseToAnyPublisher()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        continuation.resume(throwing: error)
                        cancellable?.cancel()
                    }
                }, receiveValue: { decodedObject in
                    continuation.resume(returning: decodedObject)
                    Log.network("\(type) 데이터 통신", decodedObject)
                })
            
        }
    }
}
