//
//  ExchangeRatesUseCase.swift
//  DomainKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import Foundation
import RxSwift

public protocol ExchangeRatesUseCase {
  func getExchangeRates() -> Single<[ExchangeRate]>
  func getExchangeRates(in date: Date) -> Single<[ExchangeRate]>
  func getExchangeRate(for currency: Currency) -> Maybe<ExchangeRate>
  func getExchangeRate(for currency: Currency, in date: Date) -> Maybe<ExchangeRate>
}
