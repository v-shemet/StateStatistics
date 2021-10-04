//
//  ExchangeRatesAssembly.swift
//  DataKit
//
//  Created by Владимир on 18.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation
import Swinject

final class ExchangeRatesAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ExchangeRatesUseCase.self) { resolver in
      ExchangeRatesRepository(
        networkService: resolver.resolve(NetworkService.self)!,
        dateFormatter: DateFormatter.date(timeZone: .UTC),
        currencyMapper: CurrencyMapper(),
        exchangeRateMapper: ExchangeRateMapper())
    }
  }
}
