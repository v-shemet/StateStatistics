//
//  ExchangeRatesAssembly.swift
//  StateStatisticsApp
//
//  Created by Vladimir Shemet on 28.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation
import Swinject

final class ExchangeRatesAssembly: Assembly {
  func assemble(container: Container) {
    register(in: container)
  }
}

// MARK: - Privates
private extension ExchangeRatesAssembly {
  func register(in container: Container) {
    container.register(ExchangeRatesView.self) { resolver in
      ExchangeRatesView(
        viewModel: resolver.resolve(ExchangeRatesViewModel.self)!
      )
    }
    
    container.register(ExchangeRatesViewModel.self) { resolver in
      ExchangeRatesViewModel(
        useCase: resolver.resolve(ExchangeRatesUseCase.self)!,
        itemMapper: ExchangeRateItemMapper()
      )
    }
  }
}
