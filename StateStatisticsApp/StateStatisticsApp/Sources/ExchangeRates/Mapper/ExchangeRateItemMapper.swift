//
//  ExchangeRateItemMapper.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import DataKit
import DomainKit
import Foundation

final class ExchangeRateItemMapper: Mapping {
  func map(_ item: ExchangeRate) -> ExchangeRateItem {
    ExchangeRateItem(
      text: mapCurrencyCode(item.currency),
      value: "\(item.rate)",
      isHighlighted: getHighlightedState(for: item.currency)
    )
  }
}

// MARK: - Privates
private extension ExchangeRateItemMapper {
  func mapCurrencyCode(_ currencyCode: Currency) -> String {
    switch currencyCode {
    case .CNY:
      return "Chinese Yuan (¥)"
    case .EUR:
      return "Euro (€)"
    case .RUB:
      return "Russian Ruble (₽)"
    case .UAH:
      return "Ukrainian hryvnia (₴)"
    case .USD:
      return "US Dollar ($)"
    case .custom(let value):
      return value
    }
  }
  
  func getHighlightedState(for currencyCode: Currency) -> Bool {
    if case .custom(_) = currencyCode {
      return false
    } else {
      return true
    }
  }
}
