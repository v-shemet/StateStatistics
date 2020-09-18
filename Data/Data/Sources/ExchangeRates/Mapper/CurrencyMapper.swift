//
//  CurrencyMapper.swift
//  DataKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation

final class CurrencyMapper: ReverseMapping {
  func map(_ currency: Currency) -> String {
    switch currency {
    case .EUR:
      return "EUR"
    case .RUB:
      return "RUB"
    case .UAH:
      return "UAH"
    case .USD:
      return "USD"
    case .custom(let code):
      return code.uppercased()
    }
  }
  
  func reverse(_ currencyCode: String) -> Currency {
    switch currencyCode.uppercased() {
    case "EUR":
      return .EUR
    case "RUB":
      return .RUB
    case "UAH":
      return .UAH
    case "USD":
      return .USD
    default:
      return .custom(currencyCode.uppercased())
    }
  }
}
