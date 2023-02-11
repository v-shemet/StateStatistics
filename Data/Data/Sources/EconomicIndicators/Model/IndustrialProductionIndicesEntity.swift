//
//  IndustrialProductionIndicesEntity.swift
//  DataKit
//
//  Created by Vladimir Shemet on 01.01.2023.
//  Copyright © 2023 Vladimir Shemet. All rights reserved.
//

import Foundation

struct IndustrialProductionIndicesEntity: Decodable {
  let allCountryCodes: [String]
  let items: [IndustrialProductionIndexCountryEntity]
}
