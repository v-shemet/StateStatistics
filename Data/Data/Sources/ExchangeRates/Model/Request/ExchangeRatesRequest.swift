//
//  ExchangeRatesRequest.swift
//  DataKit
//
//  Created by Владимир on 17.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

struct ExchangeRatesRequest {
  let date: String?
  let currencyCode: String?
  
  /// The parameter is required by the design of the NBU's API in order to receive a response in JSON format
  let json: String = ""
}

// MARK: - Encodable
extension ExchangeRatesRequest: Encodable {
  private enum CodingKeys: String, CodingKey {
    case date
    case currencyCode = "valcode"
    case json
  }
}
