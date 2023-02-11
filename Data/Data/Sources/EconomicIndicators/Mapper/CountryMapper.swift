//
//  CountryMapper.swift
//  DataKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import DomainKit
import Foundation

final class CountryMapper: Mapping {
  func map(_ item: IndustrialProductionIndexCountryEntity) throws -> Country {
    Country(
      code: item.countryCode,
      name: item.countryName
    )
  }
}
