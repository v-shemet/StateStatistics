//
//  NetworkTargetType.swift
//  Data
//
//  Created by Владимир on 13.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Moya

protocol NetworkTargetType: Moya.TargetType {
  var shouldAuthorize: Bool { get }
}

extension NetworkTargetType {
  var baseURL: URL { fatalError("The baseUrl should be configured whithin 'NetworkProviderBuilder'") }
  var headers: [String: String]? { nil }
  var sampleData: Data { Data() }
  var validationType: Moya.ValidationType { .successCodes }
  
  var shouldAuthorize: Bool {
      guard let authorizable = self as? AccessTokenAuthorizable else { return false }
      return authorizable.authorizationType != nil
  }
}
