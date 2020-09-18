//
//  ExchangeRateMapper.swift
//  DataKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation

final class ExchangeRateMapper: Mapping {
  private lazy var dateFormatter = DateFormatter.dateWithDot()
  private lazy var currencyMapper = CurrencyMapper()
  
  func map(_ item: ExchangeRateResponse) throws -> ExchangeRate {
    guard let exchangeDate = dateFormatter.date(from: item.exchangeDate) else { throw DataError.objectMapping }
    
    return ExchangeRate(
      currency: currencyMapper.reverse(item.currencyCode),
      rate: item.rate,
      exchangeDate: exchangeDate
    )
  }
}
