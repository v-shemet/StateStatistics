//
//  ExchangeRatesServiceApi.swift
//  DataKit
//
//  Created by Владимир on 17.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation
import Moya

enum ExchangeRatesServiceApi {
  case exchangeRatesByNBU(ExchangeRatesRequest)
}

// MARK: - NetworkTargetType
extension ExchangeRatesServiceApi: NetworkTargetType {
  var path: String {
    switch self {
    case .exchangeRatesByNBU:
      return "/NBUStatService/v1/statdirectory/exchange"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .exchangeRatesByNBU:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .exchangeRatesByNBU(let parameters):
      guard let params = try? parameters.asDictionary(with: .encoder(with: .date())) else { fatalError() }
      
      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
  }
}
