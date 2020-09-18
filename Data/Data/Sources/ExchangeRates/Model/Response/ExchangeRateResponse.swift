//
//  ExchangeRateResponse.swift
//  DataKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

struct ExchangeRateResponse {
  let currencyCode: String
  let rate: Float
  let exchangeDate: String
}

// MARK: - Decodable
extension ExchangeRateResponse: Decodable {
  private enum CodingKeys: String, CodingKey {
    case currencyCode = "cc"
    case rate
    case exchangeDate = "exchangedate"
  }
}
