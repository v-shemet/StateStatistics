//
//  ExchangeRate.swift
//  DomainKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation

public struct ExchangeRate {
  public let currency: Currency
  public let rate: Float
  public let exchangeDate: Date
  
  public init(currency: Currency, rate: Float, exchangeDate: Date) {
    self.currency = currency
    self.rate = rate
    self.exchangeDate = exchangeDate
  }
}
