//
//  ExchangeRatesViewModel.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import Foundation
import DataKit
import DomainKit
import RxSwift

final class ExchangeRatesViewModel: ObservableObject {
  private let useCase: ExchangeRatesUseCase
  private let itemMapper: ExchangeRateItemMapper
  private let disposeBag: DisposeBag = DisposeBag()

  @Published var contentState: ContentState = .idle
  
  init(useCase: ExchangeRatesUseCase,
       itemMapper: ExchangeRateItemMapper) {
    self.useCase = useCase
    self.itemMapper = itemMapper
  }
  
  @MainActor
  func loadData() {
    useCase.getExchangeRates()
      .subscribe(on: MainScheduler.instance)
      .do(
        onSubscribe: { [weak self] in
          self?.contentState = .loading
        }
      )
      .map(itemMapper.map)
      .subscribe(
        onSuccess: { [weak self] items in
          self?.contentState = .data(items)
        },
        onFailure: { [weak self] _ in
          self?.contentState = .error("Something went wrong!")
        }
      )
      .disposed(by: disposeBag)
  }
}

// MARK: - ContentState
extension ExchangeRatesViewModel {
  enum ContentState {
    case idle
    case loading
    case data([ExchangeRateItem])
    case error(String)
  }
}
