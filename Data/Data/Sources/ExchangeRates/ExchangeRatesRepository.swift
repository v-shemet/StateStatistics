//
//  ExchangeRatesRepository.swift
//  DataKit
//
//  Created by Владимир on 17.09.2020.
//  Copyright © 2020 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation
import RxSwift

final class ExchangeRatesRepository {
  private let networkService: NetworkService
  private let dateFormatter: DateFormatter
  private let currencyMapper: CurrencyMapper
  private let exchangeRateMapper: ExchangeRateMapper
  
  init(networkService: NetworkService, dateFormatter: DateFormatter, currencyMapper: CurrencyMapper, exchangeRateMapper: ExchangeRateMapper) {
    self.networkService = networkService
    self.dateFormatter = dateFormatter
    self.currencyMapper = currencyMapper
    self.exchangeRateMapper = exchangeRateMapper
  }
}

// MARK: - ExchangeRatesUseCase
extension ExchangeRatesRepository: ExchangeRatesUseCase {
  func getExchangeRates() -> Single<[ExchangeRate]> {
    getExchangeRates(with: .init(date: nil, currencyCode: nil))
  }
  
  func getExchangeRates(in date: Date) -> Single<[ExchangeRate]> {
    getExchangeRates(
      with: .init(
        date: dateFormatter.string(from: date),
        currencyCode: nil
      )
    )
  }
  
  func getExchangeRate(for currency: Currency) -> Maybe<ExchangeRate> {
    getExchangeRates(with: .init(date: nil, currencyCode: currencyMapper.map(currency)))
      .flatMapMaybe { response -> Maybe<ExchangeRate> in
        guard let rate = response.first else { return .empty() }
        
        return .just(rate)
      }
  }
  
  func getExchangeRate(for currency: Currency, in date: Date) -> Maybe<ExchangeRate> {
    let request = ExchangeRatesRequest(
      date: dateFormatter.string(from: date),
      currencyCode: currencyMapper.map(currency)
    )
    
    return getExchangeRates(with: request)
      .flatMapMaybe { response -> Maybe<ExchangeRate> in
        guard let rate = response.first else { return .empty() }
        
        return .just(rate)
      }
  }
  
  private func getExchangeRates(with request: ExchangeRatesRequest) -> Single<[ExchangeRate]> {
    networkService.execute(ExchangeRatesServiceApi.exchangeRatesByNBU(request), with: [ExchangeRateResponse].self)
      .map(exchangeRateMapper.map)
  }
}
