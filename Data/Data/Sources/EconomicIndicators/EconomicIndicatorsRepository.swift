//
//  EconomicIndicatorsRepository.swift
//  DataKit
//
//  Created by Vladimir Shemet on 30.12.2022.
//  Copyright © 2022 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation

final class EconomicIndicatorsRepository {
  private let ipiStorage: IndustrialProductionIndexStorage
  private let countryMapper: CountryMapper
  private let productionIndexMapper: ProductionIndexMapper
  
  init(ipiStorage: IndustrialProductionIndexStorage,
       countryMapper: CountryMapper,
       productionIndexMapper: ProductionIndexMapper) {
    self.ipiStorage = ipiStorage
    self.countryMapper = countryMapper
    self.productionIndexMapper = productionIndexMapper
  }
}

// MARK: - EconomicIndicatorsUseCase
extension EconomicIndicatorsRepository: EconomicIndicatorsUseCase {
  func getAllCountries() async throws -> [Country] {
    try await ipiStorage.getIndustrialProductionIndices().items
      .map(countryMapper.map)
  }
  
  func getIndustrialProductionIndex(by countryCode: String) async throws -> [ProductionIndex] {
    try await ipiStorage.getIndustrialProductionIndices().items
      .first(where: { $0.countryCode == countryCode })?.indices
      .map(productionIndexMapper.map) ?? []
  }
}
