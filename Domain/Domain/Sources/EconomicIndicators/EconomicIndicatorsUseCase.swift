//
//  EconomicIndicatorsUseCase.swift
//  DomainKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import Foundation

public protocol EconomicIndicatorsUseCase {
  func getAllCountries() async throws -> [Country]
  func getIndustrialProductionIndex(by countryCode: String) async throws -> [ProductionIndex]
}
