//
//  NetworkServiceImpl.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Moya
import RxSwift

final class NetworkServiceImpl {
  private let providerBuilder: NetworkProviderBuilder
  private let jsonDecoder: JSONDecoder

  init(providerBuilder: NetworkProviderBuilder, jsonDecoder: JSONDecoder) {
    self.providerBuilder = providerBuilder
    self.jsonDecoder = jsonDecoder
  }
}

// MARK: - NetworkService
extension NetworkServiceImpl: NetworkService {
  func execute<Target: NetworkTargetType, Value: Decodable>(_ target: Target, with type: Value.Type = Value.self) -> Single<Value> {
    createRequest(target, with: type)
  }
    
  func execute<Target: NetworkTargetType>(_ target: Target) -> Completable {
    createRequest(target)
      .asCompletable()
  }
}

// MARK: - Privates
private extension NetworkServiceImpl {
  func createRequest<Target: NetworkTargetType, Value: Decodable>(_ target: Target, with type: Value.Type) -> Single<Value> {
    createRequest(target)
      .map(Value.self, using: jsonDecoder)
  }
    
  func createRequest<Target: NetworkTargetType>(_ target: Target) -> Single<Response> {
    providerBuilder.provider(for: Target.self).rx.request(target)
  }
}
