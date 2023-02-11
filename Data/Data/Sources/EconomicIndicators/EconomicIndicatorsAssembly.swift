//
//  EconomicIndicatorsAssembly.swift
//  DataKit
//
//  Created by Vladimir Shemet on 30.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation
import Swinject

final class EconomicIndicatorsAssembly: Assembly {
  private enum Resources {
    static let industrialProductionIndicesPath = Bundle.current.path(forResource: "IndustrialProductionIndices", ofType: "json")!
  }
  
  func assemble(container: Container) {
    registerStorage(in: container)
    
    container.register(EconomicIndicatorsUseCase.self) { resolver in
      EconomicIndicatorsRepository(
        ipiStorage: resolver.resolve(IndustrialProductionIndexStorage.self)!,
        countryMapper: CountryMapper(),
        productionIndexMapper: ProductionIndexMapper()
      )
    }
  }
}

// MARK: - Private
private extension EconomicIndicatorsAssembly {
  func registerStorage(in container: Container) {
    container.register(IndustrialProductionIndexStorage.self) { resolver in
      let jsonDecoder = JSONDecoder()
      return IndustrialProductionIndexStorageImpl(
        path: Resources.industrialProductionIndicesPath,
        jsonDecoder: jsonDecoder
      )
    }
  }
}
