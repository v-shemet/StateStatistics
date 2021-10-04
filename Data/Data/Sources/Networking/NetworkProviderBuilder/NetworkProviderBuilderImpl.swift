//
//  NetworkProviderBuilderImpl.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation
import Moya

final class NetworkProviderBuilderImpl: NetworkProviderBuilder {
  private let baseUrl: URL
  private let lock = NSLock()
  private var plugins: [Moya.PluginType]
  private var providers: [Swift.ObjectIdentifier: AnyObject] = [:]
    
  init(baseUrl: URL, plugins: [Moya.PluginType] = []) {
    self.baseUrl = baseUrl
    self.plugins = plugins
  }
    
  func provider<T: NetworkTargetType>(for type: T.Type) -> Moya.MoyaProvider<T> {
    provider()
  }
    
  func provider<T: NetworkTargetType>(stubClosure: @escaping MoyaProvider<T>.StubClosure = defaultStub) -> Moya.MoyaProvider<T> {
    let identifier = Swift.ObjectIdentifier(T.self)
        
    return lock.sync {
      if let provider = providers[identifier] as? Moya.MoyaProvider<T> { return provider }
            
      let provider = Moya.MoyaProvider<T>(endpointClosure: endpoint, stubClosure: stubClosure, plugins: plugins)
      providers[identifier] = provider
            
      return provider
    }
  }
    
  private static func defaultStub<T: Moya.TargetType>(_ target: T) -> Moya.StubBehavior {
    guard let target = target as? NetworkTargetStubSupportable else { return .never }

    return target.stubBehavior
  }
}

// MARK: - Privates
private extension NetworkProviderBuilderImpl {
  func endpoint<T: NetworkTargetType>(_ target: T) -> Moya.Endpoint {
    let url: URL = baseUrl.appendingPathComponent(target.path)
        
    return Endpoint(
      url: url.absoluteString,
      sampleResponseClosure: { .networkResponse(200, target.sampleData) },
      method: target.method,
      task: target.task,
      httpHeaderFields: target.headers
    )
  }
}
