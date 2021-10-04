//
//  NetworkingAssembly.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation
import Moya
import Swinject

private enum NetworkingConfig {
  static let baseUrl: URL = URL(string: "https://bank.gov.ua")!
}

final class NetworkingAssembly: Assembly {
  func assemble(container: Container) {
    registerNetworkProviderBuilder(in: container)
    registerLogger(in: container)
    registerNetworkService(in: container)
  }
}

// MARK: - Privates
private extension NetworkingAssembly {
  func registerNetworkService(in container: Container) {
    container.register(NetworkService.self) { resolver in
      NetworkServiceImpl(
        providerBuilder: resolver.resolve(NetworkProviderBuilder.self)!,
        jsonDecoder: .iso8601compatible
      )
    }
  }
  
  func registerNetworkProviderBuilder(in container: Container) {
    container.register(NetworkProviderBuilder.self) { resolver in
      NetworkProviderBuilderImpl(
        baseUrl: NetworkingConfig.baseUrl,
        plugins: [
          resolver.resolve(NetworkLoggerPlugin.self)!
        ]
      )
    }
  }
  
  func registerLogger(in container: Container) {
    container.register(NetworkLoggerPlugin.self) { _ in
      #if DEBUG
      let dataFormatter = NetworkJSONResponseFormatter()
      let formatter = NetworkLoggerPlugin.Configuration.Formatter(responseData: dataFormatter.format)
      let configuration = NetworkLoggerPlugin.Configuration(
        formatter: formatter,
        output: NetworkLoggerPlugin.Configuration.defaultOutput,
        logOptions: .verbose
      )
      
      return NetworkLoggerPlugin(configuration: configuration)
      #else
      return NetworkLoggerPlugin()
      #endif
    }
  }
}
